import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CardApresentarUsuario extends StatefulWidget {
  const CardApresentarUsuario({super.key});

  @override
  State<CardApresentarUsuario> createState() => _CardApresentarUsuarioState();
}

class _CardApresentarUsuarioState extends State<CardApresentarUsuario> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> usuarios = [];

  @override
  void initState() {
    super.initState();
    carregarUsuarios();
  }

  Future<void> carregarUsuarios() async {
    final response = await supabase.from('Usuarios').select();
    setState(() {
      usuarios = List<Map<String, dynamic>>.from(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: usuarios.map((usuario) {
        final codigo = usuario['Codigo']?.toString() ?? '';
        final nome = usuario['Nome'] ?? '';
        final ra = usuario['RA'] ?? '';
        final tipo = usuario['Tipo'] ?? '';

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            constraints: const BoxConstraints(
                minWidth: 600, maxWidth: 1000, minHeight: 50),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff7ecd73),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$codigo - $nome ($tipo) - RA: $ra',
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
