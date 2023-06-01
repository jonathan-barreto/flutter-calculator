import 'package:flutter/material.dart';
import 'package:imc_app/button_inferior.dart';
import 'package:imc_app/constantes.dart';
import 'package:imc_app/container_widget.dart';

class TelaResultados extends StatelessWidget {
  const TelaResultados({
    super.key,
    required this.resultadoIMC,
    required this.resultadoTexto,
    required this.resultadoInterpretacao,
  });

  final String resultadoIMC;
  final String resultadoTexto;
  final String resultadoInterpretacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALCULADORA IMC'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Container(
                child: const Text(
                  'RESULTADO',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ContainerWidget(
              cor: corAtivaPadrao,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultadoTexto.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    resultadoIMC,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    resultadoInterpretacao,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BotaoInferior(
            textButton: 'RECALCULAR',
            aoPressionar: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
