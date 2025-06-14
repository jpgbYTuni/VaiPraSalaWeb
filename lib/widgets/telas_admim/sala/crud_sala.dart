import 'package:flutter/material.dart';
import '../titulo_tela.dart';
import './card_criar_sala.dart';
import './card_apresentar_sala.dart';

class CrudSala extends StatelessWidget {
  const CrudSala({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          TituloTela(
            texto: 'Salas',
            actions: CardCriarSala(sala: {}),
          ),
          Center(
            child: Column(
              children: const [
                SizedBox(height: 60),
                CardApresentarSala(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
