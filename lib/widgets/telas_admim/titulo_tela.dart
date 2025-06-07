import 'package:flutter/material.dart';

class TituloTela extends StatelessWidget {
  final String texto;
  final dynamic actions;

  const TituloTela({super.key, required this.texto, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            '$texto',
            style: TextStyle(
              color: const Color(0xff51703c),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                        actions: [
                          actions,
                        ],
                      ));
            },
            icon: Icon(Icons.add),
            color: const Color(0xff51703c),
            hoverColor: const Color(0xff7ecd73),
            iconSize: 40,
          )
        ]));
  }
}
