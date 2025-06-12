import 'package:flutter/material.dart';

class CardApresentarSala extends StatelessWidget {
  final String numero;
  final String bloco;
  final int? qtCadeira;
  final int? qtCadeiraPcd;
  final int? qtComputador;
  final bool tv;
  final bool projetor;
  final bool ar;
  final bool defeitoTv;
  final bool defeitoProjetor;
  final bool defeitoAr;
  final bool defeitoManutencao;

  const CardApresentarSala({
    super.key,
    required this.numero,
    required this.bloco,
    this.qtCadeira,
    this.qtCadeiraPcd,
    this.qtComputador,
    required this.tv,
    required this.projetor,
    required this.ar,
    required this.defeitoTv,
    required this.defeitoProjetor,
    required this.defeitoAr,
    required this.defeitoManutencao,
  });

  Widget _printIco(dynamic icon, dynamic cor) {
    return Container(
      constraints:
          const BoxConstraints(minWidth: 30, maxWidth: 30, minHeight: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(icon, color: cor, size: 20),
    );
  }

  Widget _validarBoolExistencia(bool existencia, dynamic ico) {
    return _printIco(
        existencia ? ico : Icons.close, existencia ? Colors.green : Colors.red);
  }

  Widget _validarBoolProblema(bool problema) {
    return _printIco(problema ? Icons.warning_amber_rounded : Icons.check,
        problema ? Colors.red : Colors.green);
  }

  Widget _compoDigitar(String descricao, String resoltado) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        children: [
          Text('$descricao:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(width: 5),
          Text(resoltado,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(children: [
        Container(
          constraints: const BoxConstraints(
              minWidth: 600, maxWidth: 1000, minHeight: 200),
          decoration: BoxDecoration(
            color: const Color(0xff7ecd73),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(children: [
            Text(
              'Sala: $numero$bloco',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _compoDigitar('Carteiras', qtCadeira?.toString() ?? '-'),
                _compoDigitar('Carteiras PCD', qtCadeiraPcd?.toString() ?? '-'),
                _compoDigitar('Computadores', qtComputador?.toString() ?? '-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _itemComponente(
                    'Projetor', Icons.aspect_ratio, projetor, defeitoProjetor),
                _itemComponente('Televisão', Icons.tv, tv, defeitoTv),
                _itemComponente('Ar', Icons.ac_unit, ar, defeitoAr),
                Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    child: Row(children: [
                      Text('manutenção',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      Icon(Icons.warning_amber_rounded,
                          color: Colors.red, size: 15),
                    ]),
                  ),
                  _validarBoolProblema(defeitoManutencao),
                ]),
              ],
            ),
          ]),
        ),
      ]),
    );
  }

  Widget _itemComponente(
      String nome, IconData icon, bool existencia, bool problema) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Column(
        children: [
          Row(children: [
            Text('$nome ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            Icon(icon, color: Colors.white, size: 15),
          ]),
          _validarBoolExistencia(existencia, icon),
          Row(children: [
            Text('Erro ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            Icon(Icons.warning_amber_rounded, color: Colors.red, size: 15),
          ]),
          _validarBoolProblema(problema),
        ],
      ),
    );
  }
}