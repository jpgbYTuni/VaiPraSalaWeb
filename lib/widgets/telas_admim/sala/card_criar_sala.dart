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

  Widget _compoDigitar(String descricao, String exemplo) {
    return Container(
      constraints: BoxConstraints(minWidth: 300, maxWidth: 300, minHeight: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$descricao:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            constraints:
                BoxConstraints(minWidth: 100, maxWidth: 100, maxHeight: 30),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: TextField(
              decoration: InputDecoration(
                labelText: exemplo,
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _campoBool(
    String item,
    IconData icon,
    bool existencia,
    bool problema,
    void Function(bool) onExistenciaChanged,
    void Function(bool) onProblemaChanged,
  ) {
    return Container(
      constraints: BoxConstraints(minWidth: 300, maxWidth: 300, minHeight: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Text(
                  '$item ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 15,
              ),
              Switch(
                thumbIcon: switchIco,
                value: existencia,
                onChanged: onExistenciaChanged,
                inactiveThumbColor: Color(0xffe7972a),
                inactiveTrackColor: Colors.black26,
                activeColor: Color(0xffe7972a),
                activeTrackColor: Colors.black26,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Switch(
                  thumbIcon: switchIcoErro,
                  value: problema,
                  onChanged: onProblemaChanged,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.black26,
                  activeColor: Colors.red,
                  activeTrackColor: Colors.red[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            constraints:
                BoxConstraints(minWidth: 400, maxWidth: 500, minHeight: 200),
            decoration: BoxDecoration(
              color: Color(0xff7ecd73),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(
                  'Criar Sala',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        _compoDigitar('Lugares', '000'),
                        _compoDigitar('Lugares PCD', '000'),
                        _compoDigitar('Computadores', '000'),
                        _compoDigitar('Número', '000'),
                        _compoDigitar('Bloco', 'abc'),
                      ],
                    ),
                    Column(
                      children: [
                        _campoBool(
                          'Projetor',
                          Icons.aspect_ratio,
                          _projetor,
                          _projetorProblema,
                          (valor) => setState(() => _projetor = valor),
                          (valor) => setState(() => _projetorProblema = valor),
                        ),
                        _campoBool(
                          'Televisão',
                          Icons.tv,
                          _tv,
                          _tvProblema,
                          (valor) => setState(() => _tv = valor),
                          (valor) => setState(() => _tvProblema = valor),
                        ),
                        _campoBool(
                          'Ar',
                          Icons.ac_unit,
                          _ar,
                          _arProblema,
                          (valor) => setState(() => _ar = valor),
                          (valor) => setState(() => _arProblema = valor),
                        ),
                        Container(
                          constraints: BoxConstraints(
                              minWidth: 300, maxWidth: 300, minHeight: 20),
                          child: Row(
                            children: [
                              Padding(
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
                              Icon(
                                Icons.warning_amber_rounded,
                                color: Colors.red,
                                size: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                child: Switch(
                                  thumbIcon: switchIcoErro,
                                  value: _inspecaoProblema,
                                  onChanged: (bool valor) {
                                    setState(() {
                                      _inspecaoProblema = valor;
                                    });
                                  },
                                  inactiveThumbColor: Colors.white,
                                  inactiveTrackColor: Colors.black26,
                                  activeColor: Colors.red,
                                  activeTrackColor: Colors.red[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Manutenção
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        text: 'Excluir',
                        buttonWidth: 70,
                        buttonHeight: 30,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        buttonColor: Colors.white,
                      ),
                      Button(
                        text: 'Editar',
                        buttonWidth: 70,
                        buttonHeight: 30,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        buttonColor: Colors.white,
                      ),
                      Button(
                        text: 'Salvar',
                        buttonWidth: 70,
                        buttonHeight: 30,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        buttonColor: Colors.white,
                      ),
                    ],
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
