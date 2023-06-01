import 'package:flutter/material.dart';

class ButtonArredondado extends StatelessWidget {
  const ButtonArredondado(
      {super.key, required this.icone, required this.aoPressionar});

  final IconData icone;
  final Function() aoPressionar;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: aoPressionar,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF7E7E7E),
      child: Icon(icone),
    );
  }
}
