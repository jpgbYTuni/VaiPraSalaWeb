import 'package:flutter/material.dart';

class CrudCurso extends StatelessWidget {
  const CrudCurso({super.key});

@override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Column(
        children: [
          Container(//titulo
              constraints: const BoxConstraints(minWidth: 100, maxWidth: 1000, minHeight: 50),
              decoration: BoxDecoration(
                color: Color(0xff51703C),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Column(children: [
                Text(
                  'CrudCurso',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ])))
        ],
      ),
    ));
  }
}
