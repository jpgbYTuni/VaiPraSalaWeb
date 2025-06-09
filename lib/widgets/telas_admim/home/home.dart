import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    'Bem vindo ao',
                    style: TextStyle(
                      color: const Color(0xff51703c),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset('images/logo.png', width: 500),
                ],
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
