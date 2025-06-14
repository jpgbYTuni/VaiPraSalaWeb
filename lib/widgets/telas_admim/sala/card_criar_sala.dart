import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CardCriarSala extends StatefulWidget {
  final Map<String, dynamic> sala;
  const CardCriarSala({super.key, required this.sala});

  @override
  State<CardCriarSala> createState() => _CardCriarSalaState();
}

class _CardCriarSalaState extends State<CardCriarSala> {
  final supabase = Supabase.instance.client;

  final TextEditingController blocoController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController cadeirasController = TextEditingController();
  final TextEditingController computadoresController = TextEditingController();
  String pcdSelecionado = 'false';

  @override
  void initState() {
    super.initState();
    if (widget.sala.isNotEmpty) {
      blocoController.text = widget.sala['Bloco'] ?? '';
      numeroController.text = widget.sala['Numero'].toString();
      cadeirasController.text = widget.sala['Cadeiras'].toString();
      computadoresController.text = widget.sala['Computadores'].toString();
      pcdSelecionado = widget.sala['PCD'].toString();
    }
  }

  Future<void> salvarSala() async {
    final salaData = {
      'Bloco': blocoController.text,
      'Numero': int.tryParse(numeroController.text) ?? 0,
      'Cadeiras': int.tryParse(cadeirasController.text) ?? 0,
      'Computadores': int.tryParse(computadoresController.text) ?? 0,
      'PCD': pcdSelecionado == 'true'
    };

    if (widget.sala.isEmpty) {
      await supabase.from('Salas').insert(salaData);
    } else {
      await supabase.from('Salas').update(salaData).eq('id', widget.sala['id']);
    }

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: blocoController,
              decoration: const InputDecoration(labelText: 'Bloco'),
            ),
            TextFormField(
              controller: numeroController,
              decoration: const InputDecoration(labelText: 'Número'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: cadeirasController,
              decoration: const InputDecoration(labelText: 'Cadeiras'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: computadoresController,
              decoration: const InputDecoration(labelText: 'Computadores'),
              keyboardType: TextInputType.number,
            ),
            DropdownButtonFormField(
              value: pcdSelecionado,
              items: const [
                DropdownMenuItem(value: 'true', child: Text('Sim')),
                DropdownMenuItem(value: 'false', child: Text('Não')),
              ],
              onChanged: (value) => setState(() => pcdSelecionado = value!),
              decoration: const InputDecoration(labelText: 'Acessível (PCD)'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: salvarSala, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7ecd73),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Salvar Sala',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
