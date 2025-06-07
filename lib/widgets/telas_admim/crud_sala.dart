import 'package:flutter/material.dart';
import './titulo_tela.dart';
import './card_sala.dart';

class CrudSala extends StatelessWidget {
  const CrudSala({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(children: [
      TituloTela(texto: 'Salas', actions: CardSala()),
      Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            CardSala(),
          ],
        ),
      ),
    ]));
  }
}
