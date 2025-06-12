import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vaiprasala/widgets/telas_admim/sala/card_apresentar_sala.dart';
import '../titulo_tela.dart';
import 'card_criar_sala.dart';

class CrudSala extends StatefulWidget {
  const CrudSala({super.key});

  @override
  State<CrudSala> createState() => _CrudSalaState();
}

class _CrudSalaState extends State<CrudSala> {
  List<dynamic> _salas = [];

  @override
  void initState() {
    super.initState();
    _carregarSalas();
  }

  Future<void> _carregarSalas() async {
    final supabase = Supabase.instance.client;

    final res = await supabase.from('Salas').select();
    setState(() {
      _salas = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          const TituloTela(texto: 'Salas', actions: CardCriarSala()),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Expanded(
                  child: ListView.builder(
                    itemCount: _salas.length,
                    itemBuilder: (context, index) {
                      final sala = _salas[index];
                      return CardApresentarSala(
                        numero: sala['Numero']?.toString() ?? '',
                        bloco: sala['Bloco']?.toString() ?? '',
                        qtCadeira: sala['Qt_cadeira'],
                        qtCadeiraPcd: sala['Qt_cadeira_pcd'],
                        qtComputador: sala['Qt_computador'],
                        tv: sala['Tv'] ?? false,
                        projetor: sala['Projetor'] ?? false,
                        ar: sala['Ar'] ?? false,
                        defeitoTv: sala['Defeito_tv'] ?? false,
                        defeitoProjetor: sala['Defeito_projetor'] ?? false,
                        defeitoAr: sala['Defeito_ar'] ?? false,
                        defeitoManutencao: sala['Defeito_manutencao'] ?? false,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}