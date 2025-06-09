import 'package:flutter/material.dart';
import '../titulo_tela.dart';
import '../sala/card_criar_sala.dart';

class CrudCurso extends StatelessWidget {
  const CrudCurso({super.key});

@override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(children: [
      TituloTela(texto: 'Cursos', actions: CardCriarSala(),),
      Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
          ],
        ),
      ),
    ]));
  }
}
