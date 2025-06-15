import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../button.dart';

class CardCriarCurso extends StatefulWidget {
  final Map<String, dynamic> cursos;

  const CardCriarCurso({super.key, required this.cursos});

  @override
  State<CardCriarCurso> createState() => _CardCriarCursoState();
}

class _CardCriarCursoState extends State<CardCriarCurso> {
  final supabase = Supabase.instance.client;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController siglaController = TextEditingController();

  Future<void> salvarCursos() async {
    final nome = nomeController.text.trim();
    final sigla =siglaController.text.trim();
    

    if (nome.isEmpty || sigla.isEmpty) {
      _mostrarErro('Preencha todos os campos corretamente.');
      return;
    }

    try {
      await supabase.from('Cursos').insert({
        'Nome': nome,
        'Sigla': sigla,
        
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
                      'Criar Curso',
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
                      _campoTexto('Nome', nomeController),
                      _campoTexto('Sigla', siglaController),
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
                    onPressed: salvarCursos,
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
