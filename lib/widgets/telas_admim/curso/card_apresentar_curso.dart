import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CardApresentarCurso extends StatefulWidget {
  const CardApresentarCurso({super.key});

  @override
  State<CardApresentarCurso> createState() => _CardApresentarCursoState();
}

class _CardApresentarCursoState extends State<CardApresentarCurso> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> cursos = [];

  @override
  void initState() {
    super.initState();
    carregarSalas();
  }

  Future<void> carregarSalas() async {
    final response = await supabase.from('Cursos').select();
    setState(() {
      cursos = List<Map<String, dynamic>>.from(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Garante que ListView funcione dentro de uma Column
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: cursos.length,
        itemBuilder: (context, index) {
          final Cursos = cursos[index];

          final sigla = Cursos['Sigla'] ?? '';
          final nome = Cursos['Nome'] ?? '';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(
                      minWidth: 800, maxWidth: 1000, minHeight: 50),
                  decoration: BoxDecoration(
                    color: const Color(0xff7ecd73),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20,
                          runSpacing: 10,
                          children: [
                            Text(
                              '$nome ',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '($sigla)',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
