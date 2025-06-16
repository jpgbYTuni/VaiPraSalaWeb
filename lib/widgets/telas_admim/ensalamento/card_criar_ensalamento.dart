import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../button.dart';

class CardCriarSala extends StatefulWidget {
  final Map<String, dynamic> salas;

  const CardCriarSala({super.key, required this.salas});

  @override
  State<CardCriarSala> createState() => _CardCriarSalaState();
}

class _CardCriarSalaState extends State<CardCriarSala> {
  final supabase = Supabase.instance.client;

  final TextEditingController blocoController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController qtcadeiraController = TextEditingController();
  final TextEditingController qtcadeirapcdController = TextEditingController();
  final TextEditingController qtcomputadoresController =
      TextEditingController();

  bool existe_tv = false;
  bool existe_Projetor = false;
  bool existe_ar = false;
  bool problema_tv = false;
  bool problema_projetor = false;
  bool problema_ar = false;
  bool problema_manutencao = false;

  Future<void> salvarSalas() async {
    final bloco = blocoController.text.trim();
    final numero = int.tryParse(numeroController.text.trim());
    final qtcadeira = int.tryParse(qtcadeiraController.text.trim());
    final qtcadeirapcd = int.tryParse(qtcadeirapcdController.text.trim());
    final qtcomputadores = int.tryParse(qtcomputadoresController.text.trim());

    if (bloco.isEmpty || numero == null || qtcadeira == null) {
      _mostrarErro('Preencha todos os campos corretamente.');
      return;
    }

    try {
      await supabase.from('Salas').insert({
        'Bloco': bloco,
        'Numero': numero,
        'Qt_cadeira': qtcadeira,
        'Qt_cadeira_pcd': qtcadeirapcd,
        'Qt_computador': qtcomputadores,
        'Tv': existe_tv,
        'Projetor': existe_Projetor,
        'Ar': existe_ar,
        'Defeito_tv': problema_tv,
        'Defeito_projetor': problema_projetor,
        'Defeito_ar': problema_ar,
        'Defeito_manutencao': problema_manutencao,
      });
      Navigator.of(context).pop(true);
    } catch (e) {
      _mostrarErro('Erro ao salvar: $e');
    }
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
                minWidth: 400, maxWidth: 500, minHeight: 300),
            decoration: BoxDecoration(
              color: const Color(0xff7ecd73),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                // Cabeçalho
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 40),
                    const Text(
                      'Criar Sala',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                // Campos
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      _campoTexto('Bloco', blocoController),
                      _campoTexto('Numero', numeroController),
                      _campoTexto(
                          'Quantidade de cadeiras', qtcadeiraController),
                      _campoTexto(
                          'Quantidade de cadeiras PCD', qtcadeirapcdController),
                      _campoTexto('Quantidade de computadores',
                          qtcomputadoresController),
                      _campoBool(
                        'TV',
                        () => existe_tv,
                        (val) => existe_tv = val,
                        () => problema_tv,
                        (val) => problema_tv = val,
                      ),
                      _campoBool(
                        'Projetor',
                        () => existe_Projetor,
                        (val) => existe_Projetor = val,
                        () => problema_projetor,
                        (val) => problema_projetor = val,
                      ),
                      _campoBool(
                        'Ar',
                        () => existe_ar,
                        (val) => existe_ar = val,
                        () => problema_ar,
                        (val) => problema_ar = val,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Em manutenção:',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Checkbox(
                            value: problema_manutencao,
                            onChanged: (value) => setState(
                                () => problema_manutencao = value ?? false),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Botão
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Button(
                    text: 'Salvar',
                    buttonWidth: 90,
                    buttonHeight: 35,
                    onPressed: salvarSalas,
                    buttonColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _campoBool(
    String objeto,
    bool Function() getExiste,
    void Function(bool) setExiste,
    bool Function() getProblema,
    void Function(bool) setProblema,
  ) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        children: [
          Text('Possui $objeto:',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          Checkbox(
            value: getExiste(),
            onChanged: (value) => setState(() => setExiste(value ?? false)),
          ),
        ],
      ),
      Row(
        children: [
          Text('Problema $objeto:',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          Checkbox(
            value: getProblema(),
            onChanged: (value) => setState(() => setProblema(value ?? false)),
          ),
        ],
      ),
    ]);
  }

  Widget _campoTexto(String label, TextEditingController controller) {
    return Container(
      constraints: const BoxConstraints(minWidth: 300, maxWidth: 300),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 35,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
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
}
