import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../button.dart';

class CardCriarTurma extends StatefulWidget {
  final Map<String, dynamic> turma;

  const CardCriarTurma({super.key, required this.turma});

  @override
  State<CardCriarTurma> createState() => _CardCriarTurmaState();
}

class _CardCriarTurmaState extends State<CardCriarTurma> {
  final supabase = Supabase.instance.client;

  final TextEditingController periodoController = TextEditingController();
  final TextEditingController idCursoController = TextEditingController();
  final TextEditingController semestreController = TextEditingController();
  final TextEditingController incrementoController = TextEditingController();
  final TextEditingController qtAlunosController = TextEditingController();
  final TextEditingController qtPcdController = TextEditingController();
  bool pcd = false;

  Future<void> salvarTurma() async {
    final periodo = periodoController.text.trim();
    final idCurso = int.tryParse(idCursoController.text.trim());
    final semestre = int.tryParse(semestreController.text.trim());
    final incremento = incrementoController.text.trim();
    final qtAlunos = int.tryParse(qtAlunosController.text.trim());
    final qtPcd = int.tryParse(qtPcdController.text.trim());

    if (periodo.isEmpty ||
        idCurso == null ||
        semestre == null ||
        qtAlunos == null ||
        qtPcd == null) {
      _mostrarErro('Preencha todos os campos corretamente.');
      return;
    }

    try {
      await supabase.from('Turmas').insert({
        'Periodo': periodo,
        'id_curso': idCurso,
        'Semestre': semestre,
        'Incremento': incremento,
        'Qt_alunos': qtAlunos,
        'Pcd': pcd,
        'Qt_pcd': qtPcd,
      });
      Navigator.of(context).pop(true);
    } catch (e) {
      _mostrarErro('Erro ao salvar: $e');
    }
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
                minWidth: 400, maxWidth: 500, minHeight: 300),
            decoration: BoxDecoration(
              color: const Color(0xff7ecd73),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                // Cabeçalho
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 40),
                    const Text(
                      'Criar Turma',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                // Campos
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      _campoTexto('Período', periodoController),
                      _campoTexto('ID do Curso', idCursoController),
                      _campoTexto('Semestre', semestreController),
                      _campoTexto('Incremento', incrementoController),
                      _campoTexto('Qt. Alunos', qtAlunosController),
                      Row(
                        children: [
                          const Text('Possui PCD:',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          Checkbox(
                              value: pcd,
                              onChanged: (value) =>
                                  setState(() => pcd = value ?? false)),
                        ],
                      ),
                      _campoTexto('Qt. PCD', qtPcdController),
                    ],
                  ),
                ),
                // Botão
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Button(
                    text: 'Salvar',
                    buttonWidth: 90,
                    buttonHeight: 35,
                    onPressed: salvarTurma,
                    buttonColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _campoTexto(String label, TextEditingController controller) {
    return Container(
      constraints: const BoxConstraints(minWidth: 300, maxWidth: 300),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 35,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
