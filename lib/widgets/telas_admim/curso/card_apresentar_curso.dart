import 'package:flutter/material.dart';

class CardApresentarCurso extends StatefulWidget {
  const CardApresentarCurso({super.key});
  @override
  _CardApresentarCursoState createState() => _CardApresentarCursoState();
}

class _CardApresentarCursoState extends State<CardApresentarCurso> {
  String nome = '';
  String sigla = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(children: [
          Container(
              constraints:
                  BoxConstraints(minWidth: 600, maxWidth: 1000, minHeight: 50),
              decoration: BoxDecoration(
                color: Color(0xff7ecd73),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      //titulo do card
                      '$nome - $sigla',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]))
        ]));
  }
}
