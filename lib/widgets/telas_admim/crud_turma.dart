import 'package:flutter/material.dart';

class CrudTurma extends StatelessWidget {
  const CrudTurma({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Center(
          child: Column(children: [
        Text(
          'CrudTurma',
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
