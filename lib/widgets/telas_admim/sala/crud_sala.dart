import 'package:flutter/material.dart';

class CrudSala extends StatelessWidget {
  const CrudSala({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Em Manutenção, tivemos problemas tecnicos',
            style: TextStyle(
              color: const Color(0xff51703c),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]));
  }
}
