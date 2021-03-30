import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;
  final int tamanhoMaximo;

  Editor({
    this.controlador,
    this.rotulo,
    this.dica,
    this.icone,
    this.tamanhoMaximo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24,
        ),
        maxLength: tamanhoMaximo != null ? tamanhoMaximo : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: rotulo,
          hintText: dica,
          icon: icone != null ? Icon(icone) : null,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}