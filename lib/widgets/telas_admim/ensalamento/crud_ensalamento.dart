import 'package:flutter/material.dart';
import '../titulo_tela.dart';
import 'card_criar_ensalamento.dart';
import 'card_apresentar_ensalamento.dart';

class Ensalamento extends StatelessWidget {
  const Ensalamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          TituloTela(
            texto: 'Ensalamento',
            actions: const CardCriarSala(salas: {}),
          ),
          Center(
            child: Column(
              children: const [
                SizedBox(height: 60),
                CardApresentarEnsalamento(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
