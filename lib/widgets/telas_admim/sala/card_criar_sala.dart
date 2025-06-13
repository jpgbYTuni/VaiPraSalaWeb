import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart';
=======
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../button.dart';

class CardCriarSala extends StatefulWidget {
  final VoidCallback? onCriada;
  final Map<String, dynamic>? sala; // Suporte para edição

  const CardCriarSala({super.key, this.onCriada, this.sala});

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

  bool _salaExiste = false;
  bool _carregandoExistencia = false;

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

<<<<<<< HEAD
  @override
  void initState() {
    super.initState();

    final sala = widget.sala;
    if (sala != null) {
      _numeroController.text = sala['Numero'] ?? '';
      _blocoController.text = sala['Bloco'] ?? '';
      _carteirasController.text = sala['Qt_cadeira']?.toString() ?? '';
      _carteirasPcdController.text = sala['Qt_cadeira_pcd']?.toString() ?? '';
      _computadoresController.text = sala['Qt_computador']?.toString() ?? '';
      _tv = sala['Tv'] ?? false;
      _tvProblema = sala['Defeito_tv'] ?? false;
      _projetor = sala['Projetor'] ?? false;
      _projetorProblema = sala['Defeito_projetor'] ?? false;
      _ar = sala['Ar'] ?? false;
      _arProblema = sala['Defeito_ar'] ?? false;
      _inspecaoProblema = sala['Defeito_manutencao'] ?? false;
    }

    _numeroController.addListener(_verificarSalaExistente);
    _blocoController.addListener(_verificarSalaExistente);
  }

  @override
  void dispose() {
    _numeroController.removeListener(_verificarSalaExistente);
    _blocoController.removeListener(_verificarSalaExistente);
    _carteirasController.dispose();
    _carteirasPcdController.dispose();
    _computadoresController.dispose();
    _numeroController.dispose();
    _blocoController.dispose();
    super.dispose();
  }

  Future<void> _verificarSalaExistente() async {
    if (widget.sala != null) return;

    final numero = _numeroController.text.trim();
    final bloco = _blocoController.text.trim().toUpperCase();

    if (numero.isEmpty || bloco.isEmpty) {
      setState(() => _salaExiste = false);
      return;
    }

    setState(() => _carregandoExistencia = true);

    try {
      final resposta = await Supabase.instance.client
          .from('Salas')
          .select()
          .eq('Numero', numero)
          .eq('Bloco', bloco);

      setState(() {
        _salaExiste = resposta.isNotEmpty;
      });
    } catch (_) {
      setState(() => _salaExiste = false);
    } finally {
      setState(() => _carregandoExistencia = false);
    }
  }

  Widget _compoDigitar(
      String descricao, String exemplo, TextEditingController controller,
      {bool apenasLetras = false}) {
=======
  Widget _compoDigitar(
      String descricao, String exemplo, TextEditingController controller) {
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
    return Container(
      constraints: BoxConstraints(minWidth: 300, maxWidth: 300),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$descricao:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            width: 100,
            height: 30,
            child: TextField(
              controller: controller,
<<<<<<< HEAD
              readOnly: widget.sala != null &&
                  (descricao.contains('Número') || descricao.contains('Bloco')),
              keyboardType:
                  apenasLetras ? TextInputType.text : TextInputType.number,
              inputFormatters: apenasLetras
                  ? [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))]
                  : [],
              textCapitalization: apenasLetras
                  ? TextCapitalization.characters
                  : TextCapitalization.none,
=======
              keyboardType: TextInputType.number,
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
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
      constraints: BoxConstraints(minWidth: 300, maxWidth: 300),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('$item ',
                  style: TextStyle(
<<<<<<< HEAD
                      color: Colors.white, fontWeight: FontWeight.bold)),
=======
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
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
<<<<<<< HEAD
              Text('Erro ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Icon(Icons.warning_amber_rounded, color: Colors.red, size: 15),
              Switch(
                thumbIcon: switchIcoErro,
                value: problema,
                onChanged: onProblemaChanged,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.black26,
                activeColor: Colors.red,
                activeTrackColor: Colors.red[700],
=======
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
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
              ),
            ],
          ),
        ],
      ),
    );
  }

<<<<<<< HEAD
  Future<void> _salvarOuEditarSala() async {
=======
  Future<void> _salvarSala() async {
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
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
<<<<<<< HEAD
      if (_salaExiste || widget.sala != null) {
        await Supabase.instance.client
            .from('Salas')
            .update(dadosSala)
            .eq('Numero', _numeroController.text)
            .eq('Bloco', _blocoController.text);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Sala atualizada com sucesso!')));
        }
      } else {
        await Supabase.instance.client.from('Salas').insert(dadosSala);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Sala criada com sucesso!')));
        }
      }
      if (widget.onCriada != null) widget.onCriada!();
      Navigator.of(context).pop();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao salvar ou editar sala')));
      }
    }
  }

  Future<void> _excluirSala() async {
    if (widget.sala == null) return;
    try {
      await Supabase.instance.client
          .from('Salas')
          .delete()
          .eq('Numero', _numeroController.text)
          .eq('Bloco', _blocoController.text);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sala excluída com sucesso!')));
      }
      if (widget.onCriada != null) widget.onCriada!();
      Navigator.of(context).pop();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Erro ao excluir sala')));
=======
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
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints(minWidth: 400, maxWidth: 500),
            decoration: BoxDecoration(
              color: Color(0xff7ecd73),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.only(top: 30, bottom: 15),
            child: Column(
              children: [
                Text(
                  widget.sala != null ? 'Editar Sala' : 'Criar Sala',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                _compoDigitar('Número da Sala', '000', _numeroController),
                _compoDigitar('Bloco', 'abc', _blocoController,
                    apenasLetras: true),
                _compoDigitar('Carteiras', '000', _carteirasController),
                _compoDigitar('Carteiras PCD', '000', _carteirasPcdController),
                _compoDigitar('Computadores', '000', _computadoresController),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
<<<<<<< HEAD
                    Text('Manutenção',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Icon(Icons.warning_amber_rounded,
                        color: Colors.red, size: 15),
                    Switch(
                      value: _inspecaoProblema,
                      onChanged: (v) => setState(() => _inspecaoProblema = v),
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.black26,
                      activeColor: Colors.red,
                      activeTrackColor: Colors.red[700],
=======
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
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (widget.sala != null)
                        Button(
                          text: 'Excluir',
                          buttonWidth: 100,
                          buttonHeight: 30,
                          onPressed: () async => await _excluirSala(),
                          buttonColor: Colors.white,
                        ),
                      Button(
                        text: _carregandoExistencia
                            ? '...'
                            : (_salaExiste || widget.sala != null
                                ? 'Editar'
                                : 'Salvar'),
                        buttonWidth: 100,
                        buttonHeight: 30,
<<<<<<< HEAD
                        onPressed: _carregandoExistencia
                            ? null
                            : () async => await _salvarOuEditarSala(),
=======
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
>>>>>>> 8e81755e2713905280d4ed291293e8a2b0d602e2
                        buttonColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              icon: Icon(Icons.close),
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
              tooltip: 'Fechar',
            ),
          ),
        ],
      ),
    );
  }
}