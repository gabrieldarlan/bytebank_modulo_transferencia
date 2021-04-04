import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class Transferencias extends ChangeNotifier {
  final List<Transferencia> _transferencias = [];

  List<Transferencia> get transferencia => _transferencias;

  adiciona(Transferencia novaTransferencia) {
    transferencia.add(novaTransferencia);

    notifyListeners();
  }
}
