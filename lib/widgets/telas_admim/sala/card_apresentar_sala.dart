import 'package:flutter/material.dart';

class CardApresentarSala extends StatefulWidget {
  const CardApresentarSala({super.key});
  @override
  _CardApresentarSalaState createState() => _CardApresentarSalaState();
}

class _CardApresentarSalaState extends State<CardApresentarSala> {
  bool projetor = false;
  bool projetorProblema = false;
  bool tv = false;
  bool tvProblema = false;
  bool ar = true;
  bool arProblema = false;
  bool inspecaoProblema = false;

  Widget _printIco(dynamic ico, dynamic cor) {
    return Container(
      constraints:
          const BoxConstraints(minWidth: 30, maxWidth: 30, minHeight: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        ico,
        color: cor,
        size: 20,
      ),
    );
  }

  Widget _validarBoolExistencia(bool existencia, dynamic ico) {
    if (existencia == true) {
      return _printIco(ico , Colors.green);
    } else {
      return _printIco(Icons.close, Colors.red);
    }
  }

  Widget _validarBoolProblema(bool Problema) {
    if (Problema == true) {
      return _printIco(Icons.warning_amber_rounded, Colors.red);
    } else {
      return _printIco(Icons.check, Colors.green);
    }
  }

  Widget _compoDigitar(String Descricao, String resoltado) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        children: [
          Text(
            '$Descricao:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            resoltado,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                  //titulo do card
                  'Sala: 16C',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _compoDigitar('Lugares', '000'),
                    _compoDigitar('Lugares PCD', '000'),
                    _compoDigitar('Computadores', '000'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: Text(
                                    //titulo do card
                                    'Projetor ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.aspect_ratio,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ])),
                          _validarBoolExistencia(projetor, Icons.aspect_ratio),
                          Row(children: [
                            Text(
                              //titulo do card
                              'Erro ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.red,
                              size: 15,
                            ),
                          ]),
                          _validarBoolProblema(projetorProblema)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: Text(
                                    //titulo do card
                                    'Televisão ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.tv,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ])),
                          _validarBoolExistencia(tv, Icons.tv ),
                          Row(children: [
                            Text(
                              //titulo do card
                              'Erro ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.red,
                              size: 15,
                            ),
                          ]),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: _validarBoolProblema(tvProblema),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: Text(
                                    //titulo do card
                                    'Ar ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.ac_unit,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ])),
                          _validarBoolExistencia(ar, Icons.ac_unit),
                          Row(children: [
                            Text(
                              //titulo do card
                              'Erro ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.red,
                              size: 15,
                            ),
                          ]),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: _validarBoolProblema(arProblema)
                              ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 4),
                            child: Row(
                              children: [
                                Text(
                                  'manutenção',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.red,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          _validarBoolProblema(inspecaoProblema),
                        ],
                      ),
                    ),
                  ],
                ),
              ]))
        ]));
  }
}
