
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;
  var formataMoeda = NumberFormat.currency(locale: 'pt', symbol: 'R\$');

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        //TODO FAZER A FORMATACAO DO VALOR
        title: Text(_transferencia.toStringValor()),
        subtitle: Text(_transferencia.toStringConta()),
        //! title: Text(formataMoeda.format(_transferencia.valor)),
        //! subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
