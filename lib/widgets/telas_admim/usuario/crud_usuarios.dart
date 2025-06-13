import 'package:flutter/material.dart';
import '../titulo_tela.dart';
import './card_criar_usuarios.dart';
import './card_apresentar_usuarios.dart';

class CrudUsuarios extends StatelessWidget {
  const CrudUsuarios({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          TituloTela(
            texto: 'Usuários',
            actions: CardCriarUsuario(usuario: {}),
          ),
          Center(
            child: Column(
              children: const [
                SizedBox(height: 60),
                CardApresentarUsuario(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
