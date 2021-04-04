import 'package:bytebank/component/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

const String _tituloAppBar = 'Criando Transferência';
const String _rotuloCampoNumeroConta = 'Número da conta';
const String _dicaCampoNumeroConta = '0000';
const String _rotuloCampoValor = 'Valor';
const String _dicaCampoValor = '0.00';
const String _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  _FormularioTransferenciaState createState() =>
      _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  var _controladorCampoNumeroConta = TextEditingController();
  var _controladorCampoValor =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');

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
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotaoConfirmar),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final String valorSemFormatacao = _controladorCampoValor.text;
    debugPrint('Valor sem formatacao $valorSemFormatacao');
    var valorFormatado = valorSemFormatacao.replaceAll(',', '.');
    // final double valor = double.tryParse(_controladorCampoValor.text);
    debugPrint('valor supostamente formatado $valorFormatado');
    final double valor = double.tryParse(valorFormatado);
    debugPrint('valor parseado pra double $valor');

    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    if (numeroConta != null && valor != null) {
      final transferenciaRecebida = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaRecebida);
    }
  }
}
