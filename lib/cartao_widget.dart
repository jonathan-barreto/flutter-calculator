import 'package:flutter/material.dart';
import 'constantes.dart';

class CartaoPadrao extends StatelessWidget {
  const CartaoPadrao({super.key, required this.icone, required this.sexo});

  final IconData icone;
  final String sexo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icone,
          size: 95,
        ),
        const SizedBox(height: 15),
        Text(
          sexo,
          style: textStyle,
        )
      ],
    );
  }
}
