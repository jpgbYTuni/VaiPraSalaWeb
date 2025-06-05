import 'package:flutter/material.dart';

class CrudUsuario extends StatelessWidget {
  const CrudUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Center(
          child: Column(children: [
        Text(
          'CrudUsuario',
          style: TextStyle(
            color: const Color(0xffe7972a),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]))
    ]);
  }
}
