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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Garante que ListView funcione dentro de uma Column
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: salas.length,
        itemBuilder: (context, index) {
          final Salas = salas[index];

          final existe_tv = Salas['Tv'] == true ? 'Sim' : 'Não';
          final existe_Projetor = Salas['Projetor'] == true ? 'Sim' : 'Não';
          final existe_ar = Salas['Ar'] == true ? 'Sim' : 'Não';
          final problema_tv = Salas['Defeito_tv'] == true ? 'Sim' : 'Não';
          final problema_projetor =
              Salas['Defeito_projetor'] == true ? 'Sim' : 'Não';
          final problema_ar = Salas['Defeito_ar'] == true ? 'Sim' : 'Não';
          final problema_manutencao =
              Salas['Defeito_manutencao'] == true ? 'Sim' : 'Não';

          final bloco = Salas['Bloco'] ?? '';
          final numero = Salas['Numero']?.toString() ?? '';
          final qtcadeira = Salas['Qt_cadeira']?.toString() ?? '';
          final qtcadeirapcd = Salas['Qt_cadeira_pcd']?.toString() ?? '';
          final qtcomputadores = Salas['Qt_computador']?.toString() ?? '';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(
                      minWidth: 500, maxWidth: 800, minHeight: 250),
                  decoration: BoxDecoration(
                    color: const Color(0xff7ecd73),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // Cabeçalho
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$bloco $numero',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        SizedBox(height: 15),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20,
                          runSpacing: 10,
                          children: [
                            _campoTexto('cadeiras', qtcadeira),
                            _campoTexto('cadeiras PCD', qtcadeirapcd),
                            _campoTexto('computadores', qtcomputadores),
                          ],
                        ),
                        SizedBox(height: 15),
                        _campoBool('TV', existe_tv, problema_tv),
                        _campoBool(
                            'Projetor', existe_Projetor, problema_projetor),
                        _campoBool('Ar', existe_ar, problema_ar),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Em manutenção: $problema_manutencao',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
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

  Widget _campoBool(String objeto, String existe, String Problema) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 5,
      children: [
        Text('Possui $objeto: $existe',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        SizedBox(width: 5),
        Text('Problema $objeto: $Problema ',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _campoTexto(String Texto, String Resultado) {
    return Text(
      '$Texto: $Resultado',
      style: const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
