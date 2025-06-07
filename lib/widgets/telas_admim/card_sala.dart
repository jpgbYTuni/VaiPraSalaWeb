import 'package:flutter/material.dart';
import '../button.dart';

class CardSala extends StatefulWidget {
  const CardSala({super.key});
  @override
  _CardSalaState createState() => _CardSalaState();
}

class _CardSalaState extends State<CardSala> {
  bool _projetor = false;
  bool _projetorProblema = false;
  bool _tv = false;
  bool _tvProblema = false;
  bool _ar = false;
  bool _arProblema = false;
  bool _inspecaoProblema = false;

  static const WidgetStateProperty<Icon> thumbIcon =
      WidgetStateProperty<Icon>.fromMap(
    <WidgetStatesConstraint, Icon>{
      WidgetState.selected: Icon(Icons.warning_amber_rounded),
      WidgetState.any: Icon(Icons.check),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(children: [
          Container(
              constraints: const BoxConstraints(
                  minWidth: 500, maxWidth: 1000, minHeight: 200),
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Text(
                        'Número:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Text(
                        'Bloco:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
                Row(
                  //informção da sala
                  children: [
                    Padding(
                      //numero
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Text(
                        'Lugares:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
                    Padding(
                      //bloco
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Text(
                        'Lugares PCD:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
                    Padding(
                      //bloco
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Text(
                        'Computadores:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
                            value: _projetor,
                            onChanged: (bool valor) {
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
                              color: Colors.white,
                              size: 15,
                            ),
                          ]),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Row(children: [
                                Switch(
                                  thumbIcon: thumbIcon,
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
                                Icon(
                                  Icons.dangerous_outlined,
                                  color: !_tv ? Colors.red : Colors.black26,
                                  size: 30,
                                ),
                                Switch(
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
                                Icon(
                                  Icons.tv,
                                  color: _tv ? Colors.white : Colors.black26,
                                  size: 30,
                                ),
                              ])),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Row(children: [
                                Icon(
                                  Icons.check_circle_outline_sharp,
                                  color: !_tvProblema
                                      ? Colors.white
                                      : Colors.black26,
                                  size: 30,
                                ),
                                Switch(
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
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color:
                                      _tvProblema ? Colors.red : Colors.black26,
                                  size: 30,
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
                                Icon(
                                  Icons.dangerous_outlined,
                                  color: !_ar ? Colors.red : Colors.black26,
                                  size: 30,
                                ),
                                Switch(
                                  value: _ar,
                                  onChanged: (bool valor) {
                                    setState(() {
                                      _ar = !_ar;
                                    });
                                  },
                                  inactiveThumbColor: const Color(0xffe7972a),
                                  inactiveTrackColor: Colors.black26,
                                  activeColor: const Color(0xffe7972a),
                                  activeTrackColor: Colors.black26,
                                ),
                                Icon(
                                  Icons.ac_unit,
                                  color: _ar ? Colors.white : Colors.black26,
                                  size: 30,
                                ),
                              ])),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Row(children: [
                                Icon(
                                  Icons.check_circle_outline_sharp,
                                  color: !_arProblema
                                      ? Colors.white
                                      : Colors.black26,
                                  size: 30,
                                ),
                                Switch(
                                  value: _arProblema,
                                  onChanged: (bool valor) {
                                    setState(() {
                                      _arProblema = !_arProblema;
                                    });
                                  },
                                  inactiveThumbColor: Colors.white,
                                  inactiveTrackColor: Colors.black26,
                                  activeColor: Colors.red,
                                  activeTrackColor: Colors.red[700],
                                ),
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color:
                                      _arProblema ? Colors.red : Colors.black26,
                                  size: 30,
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
                                'Inspeção',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Row(children: [
                                Icon(
                                  Icons.check_circle_outline_sharp,
                                  color: !_inspecaoProblema
                                      ? Colors.white
                                      : Colors.black26,
                                  size: 30,
                                ),
                                Switch(
                                  value: _inspecaoProblema,
                                  onChanged: (bool valor) {
                                    setState(() {
                                      _inspecaoProblema = !_inspecaoProblema;
                                    });
                                  },
                                  inactiveThumbColor: Colors.white,
                                  inactiveTrackColor: Colors.black26,
                                  activeColor: Colors.red,
                                  activeTrackColor: Colors.red[700],
                                ),
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: _inspecaoProblema
                                      ? Colors.red
                                      : Colors.black26,
                                  size: 30,
                                ),
                              ])),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(
                            text: 'Excluir',
                            buttonWidth: 100,
                            buttonHeight: 30,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('Popup'),
                                        content: Text('Você clicou no botão.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text('Fechar'),
                                          ),
                                        ],
                                      ));
                            },
                            buttonColor: Colors.white),
                        Button(
                            text: 'Editar',
                            buttonWidth: 100,
                            buttonHeight: 30,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('Popup'),
                                        content: Text('Você clicou no botão.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text('Fechar'),
                                          ),
                                        ],
                                      ));
                            },
                            buttonColor: Colors.white),
                        Button(
                            text: 'Salvar',
                            buttonWidth: 100,
                            buttonHeight: 30,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('Popup'),
                                        content: Text('Você clicou no botão.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text('Fechar'),
                                          ),
                                        ],
                                      ));
                            },
                            buttonColor: Colors.white),
                      ]),
                ),
              ]))
        ]));
  }
}
