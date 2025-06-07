import 'package:flutter/material.dart';

class CardApresentarSala extends StatefulWidget {
  const CardApresentarSala({super.key});
  @override
  _CardApresentarSalaState createState() => _CardApresentarSalaState();
}

class _CardApresentarSalaState extends State<CardApresentarSala> {
  bool _projetor = false;
  bool _projetorProblema = false;
  bool _tv = false;
  bool _tvProblema = false;
  bool _ar = false;
  bool _arProblema = false;
  bool _inspecaoProblema = false;

  static const WidgetStateProperty<Icon> switchIcoErro =
      WidgetStateProperty<Icon>.fromMap(
    <WidgetStatesConstraint, Icon>{
      WidgetState.selected: Icon(Icons.warning_amber_rounded),
      WidgetState.any: Icon(Icons.check),
    },
  );
  static const WidgetStateProperty<Icon> switchIco =
      WidgetStateProperty<Icon>.fromMap(
    <WidgetStatesConstraint, Icon>{
      WidgetState.selected: Icon(Icons.check),
      WidgetState.any: Icon(Icons.close),
    },
  );

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
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Row(children: [
                          Text(
                            'Número: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(
                                minWidth: 20, maxWidth: 60, maxHeight: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: '000',
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ])),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Row(children: [
                          Text(
                            'Bloco: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(
                                minWidth: 20, maxWidth: 60, maxHeight: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: '000',
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ])),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            'Lugares: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(
                                minWidth: 20, maxWidth: 60, maxHeight: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: '000',
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      //bloco
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            'Lugares PCD: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(
                                minWidth: 20, maxWidth: 60, maxHeight: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: '000',
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      //bloco
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            'Computadores: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(
                                minWidth: 20, maxWidth: 60, maxHeight: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: '000',
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                          Switch(
                            thumbIcon: switchIco,
                            value: _projetor,
                            onChanged: (bool value) {
                              setState(() {
                                _projetor = !_projetor;
                              });
                            },
                            inactiveThumbColor: const Color(0xffe7972a),
                            inactiveTrackColor: Colors.black26,
                            activeColor: const Color(0xffe7972a),
                            activeTrackColor: Colors.black26,
                          ),
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
                              child: Row(children: [
                                Switch(
                                  thumbIcon: switchIcoErro,
                                  value: _projetorProblema,
                                  onChanged: (bool valor) {
                                    setState(() {
                                      _projetorProblema = !_projetorProblema;
                                    });
                                  },
                                  inactiveThumbColor: Colors.white,
                                  inactiveTrackColor: Colors.black26,
                                  activeColor: Colors.red,
                                  activeTrackColor: Colors.red[700],
                                ),
                              ])),
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
                          Switch(
                            thumbIcon: switchIco,
                            value: _tv,
                            onChanged: (bool valor) {
                              setState(() {
                                _tv = !_tv;
                              });
                            },
                            inactiveThumbColor: const Color(0xffe7972a),
                            inactiveTrackColor: Colors.black26,
                            activeColor: const Color(0xffe7972a),
                            activeTrackColor: Colors.black26,
                          ),
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
                              child: Row(children: [
                                Switch(
                                  thumbIcon: switchIcoErro,
                                  value: _tvProblema,
                                  onChanged: (bool valor) {
                                    setState(() {
                                      _tvProblema = !_tvProblema;
                                    });
                                  },
                                  inactiveThumbColor: Colors.white,
                                  inactiveTrackColor: Colors.black26,
                                  activeColor: Colors.red,
                                  activeTrackColor: Colors.red[700],
                                ),
                              ])),
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
                          Switch(
                            thumbIcon: switchIco,
                            value: _ar,
                            onChanged: (bool valor) {
                              AlertDialog(title: Text('edição negada'),);
                            },
                            inactiveThumbColor: const Color(0xffe7972a),
                            inactiveTrackColor: Colors.black26,
                            activeColor: const Color(0xffe7972a),
                            activeTrackColor: Colors.black26,
                          ),
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
                              child: Row(children: [
                                Switch(
                                  thumbIcon: switchIcoErro,
                                  value: _arProblema,
                                  onChanged: (bool valor) {
                                    AlertDialog(title: Text('edição negada'),);
                                  },
                                  inactiveThumbColor: Colors.white,
                                  inactiveTrackColor: Colors.black26,
                                  activeColor: Colors.red,
                                  activeTrackColor: Colors.red[700],
                                ),
                              ])),
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
                              child: Text(
                                'manutenção',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.red,
                            size: 15,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Row(children: [
                                Switch(
                                  thumbIcon: switchIcoErro,
                                  value: _inspecaoProblema,
                                  onChanged: (bool valor) {
                                    AlertDialog(title: Text('edição negada'),);
                                  },
                                  inactiveThumbColor: Colors.white,
                                  inactiveTrackColor: Colors.black26,
                                  activeColor: Colors.red,
                                  activeTrackColor: Colors.red[700],
                                ),
                              ])),
                        ],
                      ),
                    ),
                  ],
                ),
              ]))
        ]));
  }
}
