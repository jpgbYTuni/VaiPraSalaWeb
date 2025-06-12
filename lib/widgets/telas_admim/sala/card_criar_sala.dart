import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../button.dart';

class CardCriarSala extends StatefulWidget {
  const CardCriarSala({super.key});

  @override
  _CardCriarSalaState createState() => _CardCriarSalaState();
}

class _CardCriarSalaState extends State<CardCriarSala> {
  final _carteirasController = TextEditingController();
  final _carteirasPcdController = TextEditingController();
  final _computadoresController = TextEditingController();
  final _numeroController = TextEditingController();
  final _blocoController = TextEditingController();

  bool _projetor = false;
  bool _projetorProblema = false;
  bool _tv = false;
  bool _tvProblema = false;
  bool _ar = false;
  bool _arProblema = false;
  bool _inspecaoProblema = false;

  static const WidgetStateProperty<Icon> switchIcoErro =
      WidgetStateProperty<Icon>.fromMap({
    WidgetState.selected: Icon(Icons.warning_amber_rounded),
    WidgetState.any: Icon(Icons.check),
  });

  static const WidgetStateProperty<Icon> switchIco =
      WidgetStateProperty<Icon>.fromMap({
    WidgetState.selected: Icon(Icons.check),
    WidgetState.any: Icon(Icons.close),
  });

  Widget _compoDigitar(
      String descricao, String exemplo, TextEditingController controller) {
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
              controller: controller,
              keyboardType: TextInputType.number,
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
              Icon(icon, color: Colors.white, size: 15),
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
            children: [
              Text(
                'Erro ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.warning_amber_rounded, color: Colors.red, size: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
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

  Future<void> _salvarSala() async {
    final dadosSala = {
      'Bloco': _blocoController.text,
      'Numero': _numeroController.text,
      'Qt_cadeira': int.tryParse(_carteirasController.text) ?? 0,
      'Qt_cadeira_pcd': _carteirasPcdController.text.isNotEmpty
          ? int.tryParse(_carteirasPcdController.text)
          : null,
      'Qt_computador': _computadoresController.text.isNotEmpty
          ? int.tryParse(_computadoresController.text)
          : null,
      'Tv': _tv,
      'Projetor': _projetor,
      'Ar': _ar,
      'Defeito_tv': _tvProblema,
      'Defeito_projetor': _projetorProblema,
      'Defeito_ar': _arProblema,
      'Defeito_manutencao': _inspecaoProblema,
    };

    try {
      await Supabase.instance.client.from('Salas').insert(dadosSala);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sala criada com sucesso!')),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      print('Erro ao salvar: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar sala')),
        );
      }
    }
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
                    _compoDigitar('Carteiras', '000', _carteirasController),
                    _compoDigitar(
                        'Carteiras PCD', '000', _carteirasPcdController),
                    _compoDigitar(
                        'Computadores', '000', _computadoresController),
                    _compoDigitar('Número', '000', _numeroController),
                    _compoDigitar('Bloco', 'abc', _blocoController),
                    _campoBool(
                        'Projetor',
                        Icons.aspect_ratio,
                        _projetor,
                        _projetorProblema,
                        (v) => setState(() => _projetor = v),
                        (v) => setState(() => _projetorProblema = v)),
                    _campoBool(
                        'Televisão',
                        Icons.tv,
                        _tv,
                        _tvProblema,
                        (v) => setState(() => _tv = v),
                        (v) => setState(() => _tvProblema = v)),
                    _campoBool(
                        'Ar',
                        Icons.ac_unit,
                        _ar,
                        _arProblema,
                        (v) => setState(() => _ar = v),
                        (v) => setState(() => _arProblema = v)),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Manutenção',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.warning_amber_rounded,
                              color: Colors.red, size: 15),
                          SizedBox(width: 8),
                          Switch(
                            thumbIcon: switchIcoErro,
                            value: _inspecaoProblema,
                            onChanged: (v) =>
                                setState(() => _inspecaoProblema = v),
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
                        onPressed: () {},
                        buttonColor: Colors.white,
                      ),
                      Button(
                        text: 'Salvar',
                        buttonWidth: 70,
                        buttonHeight: 30,
                        onPressed: _salvarSala,
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