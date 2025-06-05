import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Center(
          child: Column(children: [
        Text(
          'Home',
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
