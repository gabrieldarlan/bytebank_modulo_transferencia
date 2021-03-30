import 'package:bytebank/component/item_transferencia.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const String _tituloAppBar = 'Transferências';
const String _dicaBotaoAdicionarTransferencia = 'Adicionar Transferência';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  _ListaTransferenciasState createState() => _ListaTransferenciasState();
}

class _ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (BuildContext context, int index) {
          final Transferencia transferencia = widget._transferencias[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormularioTransferencia(),
            ),
          ).then(
            (transferenciaRecebida) => _atualiza(transferenciaRecebida),
          );
        },
        tooltip: _dicaBotaoAdicionarTransferencia,
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}
