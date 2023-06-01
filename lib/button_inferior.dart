import 'package:flutter/material.dart';
import 'constantes.dart';

class BotaoInferior extends StatelessWidget {
  const BotaoInferior({
    super.key,
    required this.textButton,
    required this.aoPressionar,
  });

  final String textButton;
  final Function() aoPressionar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        height: alturaContainerInferior,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        color: corContainerInferior,
        child: Center(
          child: Text(
            textButton,
            style: const TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
