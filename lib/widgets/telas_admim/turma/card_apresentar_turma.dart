import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import './card_criar_turma.dart';

class CardApresentarTurma extends StatefulWidget {
  const CardApresentarTurma({super.key});

  @override
  State<CardApresentarTurma> createState() => _CardApresentarTurmaState();
}

class _CardApresentarTurmaState extends State<CardApresentarTurma> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> turmas = [];

  @override
  void initState() {
    super.initState();
    carregarTurmas();
  }

  Future<void> carregarTurmas() async {
    final response = await supabase.from('Turmas').select();
    setState(() {
      turmas = List<Map<String, dynamic>>.from(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: turmas.map((turma) {
        final periodo = turma['Periodo'] ?? '';
        final idCurso = turma['id_curso']?.toString() ?? '';
        final semestre = turma['Semestre']?.toString() ?? '';
        final incremento = turma['Incremento'] ?? '';
        final qtAlunos = turma['Qt_alunos']?.toString() ?? '';
        final pcd = turma['Pcd'] == true ? 'Sim' : 'Não';
        final qtPcd = turma['Qt_pcd']?.toString() ?? '';

        final label = incremento.toLowerCase() == 'unico'
            ? 'Curso $idCurso - $periodo/$semestre'
            : 'Curso $idCurso - $periodo/$semestre$incremento';

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            constraints: const BoxConstraints(minWidth: 600, maxWidth: 1000),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff7ecd73),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$label - Alunos: $qtAlunos - PCD: $pcd ($qtPcd)',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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
