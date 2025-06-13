import 'package:flutter/material.dart';
import '../titulo_tela.dart';
import './card_criar_curso.dart';
import './card_apresentar_curso.dart';

class CrudCurso extends StatelessWidget {
  const CrudCurso({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(children: [
<<<<<<< HEAD
      TituloTela(
        texto: 'Cursos',
        actions: CardCriarCurso(
          curso: {},
        ),
      ),
      Center(
        child: Column(
          children: [const SizedBox(height: 60), CardApresentarCurso()],
=======
      TituloTela(texto: 'Cursos', actions: CardCriarCurso(),),
      Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            CardApresentarCurso()
          ],
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
        ),
      ),
    ]));
  }
}
