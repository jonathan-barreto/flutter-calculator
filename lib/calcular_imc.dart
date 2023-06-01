import 'dart:math';

class CalculadoraIMC {
  CalculadoraIMC({
    required this.altura,
    required this.peso,
  });

  final int altura;
  final int peso;
  double imc = 0;

  String calcularIMC() {
    double imc = peso / pow(altura / 100, 2);
    return imc.toStringAsFixed(1);
  }

  String obterResultado(imc) {
    double meuImc = double.parse(imc);
    if (meuImc >= 25) {
      return 'Acima do peso';
    } else if (meuImc > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do peso';
    }
  }

  String obterInterpretacao(imc) {
    double meuImc = double.parse(imc);
    if (meuImc >= 25) {
      return 'Você está com o peso acima do normal.';
    } else if (meuImc > 18.5) {
      return 'Excelente! O seu peso está normal!';
    } else {
      return 'Você está com o peso abaixo do normal!';
    }
  }
}
