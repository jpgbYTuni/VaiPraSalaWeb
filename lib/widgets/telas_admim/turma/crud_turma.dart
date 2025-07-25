import 'package:flutter/material.dart';
import '../titulo_tela.dart';
import './card_criar_turma.dart';
import './card_apresentar_turma.dart';

class CrudTurma extends StatelessWidget {
  const CrudTurma({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          TituloTela(
            texto: 'Turmas',
            actions: CardCriarTurma(turma: {}),
          ),
          Center(
            child: Column(
              children: const [
                SizedBox(height: 60),
                CardApresentarTurma(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
