import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.cor,
    this.filhoCartao,
    this.aoPressionar,
  });

  final Color cor;
  final Widget? filhoCartao;
  final Function()? aoPressionar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cor,
        ),
        child: filhoCartao,
      ),
    );
  }
}
