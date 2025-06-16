import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CardApresentarEnsalamento extends StatefulWidget {
  const CardApresentarEnsalamento({super.key});

  @override
  State<CardApresentarEnsalamento> createState() =>
      _CardApresentarEnsalamentoState();
}

class _CardApresentarEnsalamentoState extends State<CardApresentarEnsalamento> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> ensalamento = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    carregarEnsalamento();
  }

  Future<void> carregarEnsalamento() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await supabase.from('Ensalamento').select();

      final List<dynamic> dadosEnsalamento = response;

      final List<Map<String, dynamic>> resultado = [];

      for (final linha in dadosEnsalamento) {
        final usuarioProf1 =
            await _getUsuarioNome(linha['codigo_usuario_prof1']);
        final usuarioProf2 =
            await _getUsuarioNome(linha['codigo_usuario_prof2']);
        final sala = await _getSala(linha['id_sala']);
        final turma1 = await _getTurma(linha['id_turma1']);
        final turma2 = await _getTurma(linha['id_turma2']);

        resultado.add({
          'linha': linha,
          'usuarioProf1': usuarioProf1,
          'usuarioProf2': usuarioProf2,
          'sala': sala,
          'turma1': turma1,
          'turma2': turma2,
        });
      }

      setState(() {
        ensalamento = resultado;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Erro ao carregar dados: ${e.toString()}';
        isLoading = false;
      });
    }
  }

  Future<String?> _getUsuarioNome(int? cod) async {
    if (cod == null) return null;
    final data = await supabase
        .from('Usuarios')
        .select('Nome')
        .eq('Codigo', cod)
        .maybeSingle();

    return data?['Nome'] as String?;
  }

  Future<Map<String, dynamic>?> _getSala(int? idSala) async {
    if (idSala == null) return null;
    final data = await supabase
        .from('Salas')
        .select('Bloco, Numero')
        .eq('ID_sala', idSala)
        .maybeSingle();

    return data;
  }

  Future<Map<String, dynamic>?> _getTurma(int? idTurma) async {
    if (idTurma == null) return null;

    final turma = await supabase
        .from('Turmas')
        .select('id_curso, Semestre, Incremento')
        .eq('ID_turma', idTurma)
        .maybeSingle();

    if (turma == null) return null;

    final curso = await supabase
        .from('Cursos')
        .select('Sigla')
        .eq('ID_curso', turma['id_curso'])
        .maybeSingle();

    return {
      'Semestre': turma['Semestre'],
      'Incremento': turma['Incremento'],
      'Curso': curso?['Sigla'] ?? '',
    };
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Text(
          errorMessage!,
          style: const TextStyle(fontSize: 16, color: Colors.redAccent),
          textAlign: TextAlign.center,
        ),
      );
    }

    if (ensalamento.isEmpty) {
      return const Center(
        child: Text(
          'Nenhum ensalamento encontrado.',
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: ensalamento.map((item) {
            final linha = item['linha'];
            final nomeProf1 = item['usuarioProf1'];
            final nomeProf2 = item['usuarioProf2'];
            final sala = item['sala'];
            final turma1 = item['turma1'];
            final turma2 = item['turma2'];
            final periodo = linha['periodo'] ?? '';
            final blocoSala =
                '${sala['Numero'] ?? ''} ${sala['Bloco'] ?? ''}';

            String incremento1;
            if (turma2['Incremento'] == 'Único') {
              incremento1 = '';
            } else {
              incremento1 = '${turma2['Incremento']}';
            }

            String incremento2;
            if (turma2['Incremento'] == 'Único') {
              incremento2 = '';
            } else {
              incremento2 = '${turma2['Incremento']}';
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 800),
                decoration: BoxDecoration(
                  color: const Color(0xff7ecd73),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$blocoSala',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Período: $periodo',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Professor 1: ${nomeProf1 ?? '—'}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      if (turma1 != null)
                        Text(
                          'Turma 1: ${turma1['Curso']} - Semestre ${turma1['Semestre']} $incremento1',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      const Divider(color: Colors.white70),
                      Text(
                        'Professor 2: ${nomeProf2 ?? '—'}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      if (turma2 != null)
                        Text(
                          'Turma 2: ${turma2['Curso']} - Semestre ${turma2['Semestre']}.$incremento2',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
