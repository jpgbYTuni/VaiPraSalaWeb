import 'package:flutter/material.dart';
import 'card_apresentar_curso.dart';
import './card_criar_curso.dart';
import '../titulo_tela.dart';

class CrudCurso extends StatelessWidget {
  const CrudCurso({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          TituloTela(
            texto: 'Cursos',
            actions: CardCriarCurso(cursos: {}),
          ),
          Center(
            child: Column(
              children: const [
                SizedBox(height: 60),
                CardApresentarCurso(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
