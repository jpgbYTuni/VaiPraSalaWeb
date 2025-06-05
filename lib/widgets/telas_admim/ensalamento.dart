import 'package:flutter/material.dart';

class Ensalamento extends StatelessWidget {
  const Ensalamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Center(
          child: Column(children: [
        Text(
          'Ensalamento',
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
