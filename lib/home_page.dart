import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imc_app/button_arredondado.dart';
import 'package:imc_app/button_inferior.dart';
import 'package:imc_app/calcular_imc.dart';
import 'package:imc_app/cartao_widget.dart';
import 'package:imc_app/container_widget.dart';
import 'package:imc_app/tela_resultados.dart';
import 'constantes.dart';

enum Sexo {
  masculino,
  feminino,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color corMasculinoCartaoPadrao = corInativaPadrao;
  Color corFemininoCartaoPadrao = corInativaPadrao;

  Sexo? sexoSelecionado;
  int altura = 170;
  int peso = 60;
  int idade = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALCULADORA IMC'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerWidget(
                    aoPressionar: () {
                      setState(() {
                        sexoSelecionado = Sexo.masculino;
                      });
                    },
                    cor: sexoSelecionado == Sexo.masculino
                        ? corAtivaPadrao
                        : corInativaPadrao,
                    filhoCartao: const CartaoPadrao(
                      icone: FontAwesomeIcons.mars,
                      sexo: 'MASCULINO',
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerWidget(
                    aoPressionar: () {
                      setState(() {
                        sexoSelecionado = Sexo.feminino;
                      });
                    },
                    cor: sexoSelecionado == Sexo.feminino
                        ? corAtivaPadrao
                        : corInativaPadrao,
                    filhoCartao: const CartaoPadrao(
                      icone: FontAwesomeIcons.venus,
                      sexo: 'FEMININO',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerWidget(
              cor: corInativaPadrao,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ALTURA',
                    style: textStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        altura.toString(),
                        style: numberStyle,
                      ),
                      const Text(
                        'cm',
                        style: textStyle,
                      )
                    ],
                  ),
                  Slider(
                    activeColor: const Color(0xFFFF5822),
                    inactiveColor: const Color(0xFF8D8E98),
                    value: altura.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double novoValor) {
                      setState(() {
                        altura = novoValor.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerWidget(
                    cor: corInativaPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'PESO',
                          style: textStyle,
                        ),
                        Text(
                          peso.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonArredondado(
                              icone: FontAwesomeIcons.minus,
                              aoPressionar: () {
                                setState(() {
                                  peso--;
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            ButtonArredondado(
                              icone: FontAwesomeIcons.plus,
                              aoPressionar: () {
                                setState(() {
                                  peso++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerWidget(
                    cor: corInativaPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'IDADE',
                          style: textStyle,
                        ),
                        Text(
                          idade.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonArredondado(
                              icone: FontAwesomeIcons.minus,
                              aoPressionar: () {
                                setState(() {
                                  idade--;
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            ButtonArredondado(
                              icone: FontAwesomeIcons.plus,
                              aoPressionar: () {
                                setState(() {
                                  idade++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BotaoInferior(
            textButton: 'CALCULAR',
            aoPressionar: () {
              CalculadoraIMC calc = CalculadoraIMC(
                altura: altura,
                peso: peso,
              );
              print(calc.calcularIMC());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaResultados(
                    resultadoIMC: calc.calcularIMC(),
                    resultadoTexto: calc.obterResultado(calc.calcularIMC()),
                    resultadoInterpretacao:
                        calc.obterInterpretacao(calc.calcularIMC()),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
