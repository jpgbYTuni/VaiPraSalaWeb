import 'package:flutter/material.dart';
import 'package:vaiprasala/widgets/telas_admim/sala/card_apresentar_sala.dart';
import '../titulo_tela.dart';
import 'card_criar_sala.dart';

class CrudSala extends StatelessWidget {
  const CrudSala({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(children: [
      TituloTela(texto: 'Salas', actions: CardCriarSala()),
      Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            CardApresentarSala()
          ],
        ),
      ),
    ]));
  }
}
