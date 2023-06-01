import 'package:flutter/material.dart';
import 'package:imc_app/home_page.dart';

void main() {
  runApp(const CalculadoraImc());
}

class CalculadoraImc extends StatelessWidget {
  const CalculadoraImc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
