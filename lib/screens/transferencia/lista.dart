import 'package:bytebank/component/item_transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String _tituloAppBar = 'Transferências';
const String _dicaBotaoAdicionarTransferencia = 'Adicionar Transferência';

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_tituloAppBar),
      ),
      body: Consumer<Transferencias>(
        builder: (context, transferencias, child) {
          return ListView.builder(
            itemCount: transferencias.transferencia.length,
            itemBuilder: (BuildContext context, int index) {
              final transferencia = transferencias.transferencia[index];
              return ItemTransferencia(transferencia);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormularioTransferencia(),
            ),
          );
        },
        tooltip: _dicaBotaoAdicionarTransferencia,
        child: Icon(Icons.add),
      ),
    );
  }
}
