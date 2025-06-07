import 'package:flutter/material.dart';
import './titulo_tela.dart';
import './card_sala.dart';

class Ensalamento extends StatelessWidget {
  const Ensalamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(children: [
      TituloTela(texto: 'Ensalamento', actions: CardSala(),),
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
