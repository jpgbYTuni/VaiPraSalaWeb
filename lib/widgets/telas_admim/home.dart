import 'package:flutter/material.dart';
import './titulo_tela.dart';
import 'card_criar_sala.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(children: [
      TituloTela(texto: 'Sala', actions: CardCriarSala(),),
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
