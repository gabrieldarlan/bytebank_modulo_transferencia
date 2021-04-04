import 'package:bytebank/component/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String _tituloAppBar = 'Criando Transferência';
const String _rotuloCampoNumeroConta = 'Número da conta';
const String _dicaCampoNumeroConta = '0000';
const String _rotuloCampoValor = 'Valor';
const String _dicaCampoValor = '0.00';
const String _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  var _controladorCampoNumeroConta = TextEditingController();
  var _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
              tamanhoMaximo: 4,
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotaoConfirmar),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);

    final transferenciaValida =
        _validaTransferencia(context, numeroConta, valor);

    if (transferenciaValida) {
      final novaTransferencia = Transferencia(valor, numeroConta);
      _atualizaEstado(context, novaTransferencia, valor);
      Navigator.pop(context);
    }
  }

  _validaTransferencia(context, numeroConta, valor) {
    final _camposPreenchidos = numeroConta != null && valor != null;
    final _saldoSuficiente = valor <=
        Provider.of<Saldo>(
          context,
          
          listen: false,
        ).valor;
  //TODO APÓS VALIDAR SE PODE FAZER TRANSFERENCIA E NÃO TIVER SALDO
  //TODO COLOCAR UM DIALOGO DIZENDO QUE SALDO É INSUFICIENTE
    return _camposPreenchidos && _saldoSuficiente;
  }

  //? O método atualiza estado além de adicionar uma nova transferencia para outra conta, atualiza o saldo do cliente
  _atualizaEstado(context, novaTransferencia, valor) {
    //! O Provider.of<Transferencias> pega a transferencia e atualiza ela na lista
    //! Sem buildar novamente os componentes visuais
    Provider.of<Transferencias>(context, listen: false)
        .adiciona(novaTransferencia);
    Provider.of<Saldo>(context, listen: false).subtrai(valor);
  }
}
