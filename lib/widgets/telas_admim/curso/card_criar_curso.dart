import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../button.dart';

class CardCriarCurso extends StatefulWidget {
  const CardCriarCurso({super.key, required Map<String, dynamic> curso});
=======
import '../../button.dart';

class CardCriarCurso extends StatefulWidget {
  const CardCriarCurso({super.key});
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2

  @override
  _CardCriarCursoState createState() => _CardCriarCursoState();
}

class _CardCriarCursoState extends State<CardCriarCurso> {
<<<<<<< HEAD
  final supabase = Supabase.instance.client;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController siglaController = TextEditingController();

  Future<void> salvarCurso() async {
    final nome = nomeController.text.trim();
    final sigla = siglaController.text.trim();

    if (nome.isEmpty || sigla.isEmpty) {
      _mostrarErro('Preencha todos os campos');
      return;
    }

    try {
      await supabase.from('Cursos').insert({'Nome': nome, 'Sigla': sigla});
      Navigator.of(context).pop(true);
    } catch (e) {
      _mostrarErro('Erro ao salvar: $e');
    }
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
=======
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
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
<<<<<<< HEAD
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
                minWidth: 400, maxWidth: 500, minHeight: 200),
            decoration: BoxDecoration(
              color: const Color(0xff7ecd73),
=======
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            constraints:
                BoxConstraints(minWidth: 400, maxWidth: 500, minHeight: 200),
            decoration: BoxDecoration(
              color: Color(0xff7ecd73),
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
<<<<<<< HEAD
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                // Campos
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Column(
                    children: [
                      _campoTexto('Nome', nomeController),
                      _campoTexto('Sigla', siglaController),
                    ],
                  ),
                ),
                // Botão
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Button(
                    text: 'Salvar',
                    buttonWidth: 90,
                    buttonHeight: 35,
                    onPressed: salvarCurso,
                    buttonColor: Colors.white,
=======
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
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD

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
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
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
=======
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
}
