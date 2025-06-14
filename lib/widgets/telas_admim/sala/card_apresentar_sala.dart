import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CardApresentarSala extends StatefulWidget {
  const CardApresentarSala({super.key});

  @override
  State<CardApresentarSala> createState() => _CardApresentarSalaState();
}

class _CardApresentarSalaState extends State<CardApresentarSala> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> salas = [];

  @override
  void initState() {
    super.initState();
    carregarSalas();
  }

  Future<void> carregarSalas() async {
    final response = await supabase.from('Salas').select();
    setState(() {
      salas = List<Map<String, dynamic>>.from(response);
    });
  }

  String _formatNome(Map<String, dynamic> sala) {
    final bloco = (sala['Bloco'] ?? '').toString().toUpperCase();
    final numero = sala['Numero'].toString();
    return bloco == 'LAB' ? '$numero$bloco' : '$bloco$numero';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: salas.map((sala) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xff7ecd73),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_formatNome(sala), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Cadeiras: ${sala['Cadeiras'] ?? 'N/A'}'),
              Text('Computadores: ${sala['Computadores'] ?? 'N/A'}'),
              Text('PCD: ${(sala['PCD'] ?? false) ? "Sim" : "Não"}'),
            ],
          ),
        );
      }).toList(),
    );
  }
}
