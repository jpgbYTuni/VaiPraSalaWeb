import 'package:flutter/material.dart';
import '../../button.dart';

class CardCriarCurso extends StatefulWidget {
  const CardCriarCurso({super.key});

  @override
  _CardCriarCursoState createState() => _CardCriarCursoState();
}

class _CardCriarCursoState extends State<CardCriarCurso> {
  Widget _compoDigitar(String descricao, String exemplo) {
    return Container(
      constraints: BoxConstraints(minWidth: 300, maxWidth: 300, minHeight: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$descricao:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            constraints:
                BoxConstraints(minWidth: 350, maxWidth: 450, maxHeight: 30),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: exemplo,
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            constraints:
                BoxConstraints(minWidth: 400, maxWidth: 500, minHeight: 200),
            decoration: BoxDecoration(
              color: Color(0xff7ecd73),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(
                  'Criar Curso',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Column(
                    children: [
                      _compoDigitar('Nome', '000'),
                      _compoDigitar('Sigla', 'esw'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        text: 'Excluir',
                        buttonWidth: 70,
                        buttonHeight: 30,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        buttonColor: Colors.white,
                      ),
                      Button(
                        text: 'Editar',
                        buttonWidth: 70,
                        buttonHeight: 30,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        buttonColor: Colors.white,
                      ),
                      Button(
                        text: 'Salvar',
                        buttonWidth: 70,
                        buttonHeight: 30,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        buttonColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
