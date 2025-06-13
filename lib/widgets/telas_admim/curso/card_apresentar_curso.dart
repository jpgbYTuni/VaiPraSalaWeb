import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import './card_criar_curso.dart';

class CardApresentarCurso extends StatefulWidget {
  const CardApresentarCurso({super.key});

  @override
  _CardApresentarCursoState createState() => _CardApresentarCursoState();
}

class _CardApresentarCursoState extends State<CardApresentarCurso> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> cursos = [];

  @override
  void initState() {
    super.initState();
    carregarCursos();
  }

  Future<void> carregarCursos() async {
    final response = await supabase.from('Cursos').select();
    setState(() {
      cursos = List<Map<String, dynamic>>.from(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cursos.map((curso) {
        final nome = curso['Nome'] ?? '';
        final sigla = curso['Sigla'] ?? '';
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Container(
            constraints:
                BoxConstraints(minWidth: 600, maxWidth: 1000, minHeight: 50),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xff7ecd73),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$nome - $sigla',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
