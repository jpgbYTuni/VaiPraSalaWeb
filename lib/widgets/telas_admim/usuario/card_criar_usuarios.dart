import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../button.dart';

class CardCriarUsuario extends StatefulWidget {
  final Map<String, dynamic> usuario;
  const CardCriarUsuario({super.key, required this.usuario});

  @override
  State<CardCriarUsuario> createState() => _CardCriarUsuarioState();
}

class _CardCriarUsuarioState extends State<CardCriarUsuario> {
  final supabase = Supabase.instance.client;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController raController = TextEditingController();
  String tipoSelecionado = 'Aluno';

  @override
  void initState() {
    super.initState();
    if (widget.usuario.isNotEmpty) {
      nomeController.text = widget.usuario['Nome'] ?? '';
      raController.text = widget.usuario['RA'] ?? '';
      tipoSelecionado = widget.usuario['Tipo'] ?? 'Aluno';
    }
  }

  Future<void> salvarUsuario() async {
    final nome = nomeController.text.trim();
    final ra = raController.text.trim();

    if (nome.isEmpty || ra.isEmpty) {
      _mostrarErro('Preencha todos os campos');
      return;
    }

    try {
      if (widget.usuario.isNotEmpty) {
        await supabase.from('Usuarios').update({
          'Nome': nome,
          'RA': ra,
          'Tipo': tipoSelecionado,
        }).match({'Codigo': widget.usuario['Codigo']});
      } else {
        await supabase.from('Usuarios').insert({
          'Nome': nome,
          'RA': ra,
          'Tipo': tipoSelecionado,
        });
      }

      Navigator.of(context).pop(true);
    } catch (e) {
      _mostrarErro('Erro ao salvar: $e');
    }
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(mensagem)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
                minWidth: 400, maxWidth: 500, minHeight: 200),
            decoration: BoxDecoration(
              color: const Color(0xff7ecd73),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 40),
                    const Text(
                      'Criar Usuário',
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Column(
                    children: [
                      _campoTexto('Nome', nomeController),
                      _campoTexto('RA', raController),
                      _dropdownTipoUsuario(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Button(
                    text: 'Salvar',
                    buttonWidth: 90,
                    buttonHeight: 35,
                    onPressed: salvarUsuario,
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

  Widget _dropdownTipoUsuario() {
    return Container(
      constraints: const BoxConstraints(minWidth: 300, maxWidth: 300),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: DropdownButtonFormField<String>(
        value: tipoSelecionado,
        items: const ['Aluno', 'Professor', 'Infra', 'Coordenação']
            .map((tipo) => DropdownMenuItem(value: tipo, child: Text(tipo)))
            .toList(),
        decoration: const InputDecoration(
          labelText: 'Tipo',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
        onChanged: (valor) {
          setState(() {
            tipoSelecionado = valor!;
          });
        },
      ),
    );
  }
}
