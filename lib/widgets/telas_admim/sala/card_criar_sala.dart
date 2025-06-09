import 'package:flutter/material.dart';
import '../../button.dart';

class CardCriarSala extends StatefulWidget {
  const CardCriarSala({super.key});
  @override
  _CardCriarSalaState createState() => _CardCriarSalaState();
}

class _CardCriarSalaState extends State<CardCriarSala> {
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

  Widget _compoDigitar(String Descricao, String exemplo) {
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
          Container(
            constraints:
                const BoxConstraints(minWidth: 20, maxWidth: 60, maxHeight: 30),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: TextField(
              decoration: InputDecoration(
                labelText: exemplo,
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
                  'Criar Sala',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _compoDigitar('Número', '000'),
                    _compoDigitar('Bloco', 'abc'),
                  ],
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
                    // Projetor
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: Text(
                                    'Projetor ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.aspect_ratio,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
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
                          Row(
                            children: const [
                              Text(
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
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: Row(
                              children: [
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Televisão
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: Text(
                                    'Televisão ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.tv,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
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
                          Row(
                            children: const [
                              Text(
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
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: Row(
                              children: [
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Ar-condicionado
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: Text(
                                    'Ar ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.ac_unit,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          Switch(
                            thumbIcon: switchIco,
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
                          Row(
                            children: const [
                              Text(
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
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: Row(
                              children: [
                                Switch(
                                  thumbIcon: switchIcoErro,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Manutenção
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: Text(
                              'manutenção',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.red,
                            size: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: Row(
                              children: [
                                Switch(
                                  thumbIcon: switchIcoErro,
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
                              ],
                            ),
                          ),
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
                              Navigator.of(context).pop();
                            },
                            buttonColor: Colors.white),
                        Button(
                            text: 'Editar',
                            buttonWidth: 100,
                            buttonHeight: 30,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            buttonColor: Colors.white),
                        Button(
                            text: 'Salvar',
                            buttonWidth: 100,
                            buttonHeight: 30,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            buttonColor: Colors.white),
                      ]),
                ),
              ]))
        ]));
  }
}
