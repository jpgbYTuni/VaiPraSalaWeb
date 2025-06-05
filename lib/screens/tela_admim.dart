import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './tela_login.dart';
import '../widgets/telas_admim/crud_curso.dart';
import '../widgets/telas_admim/crud_sala.dart';
import '../widgets/telas_admim/crud_turma.dart';
import '../widgets/telas_admim/crud_usuario.dart';
import '../widgets/telas_admim/ensalamento.dart';
import '../widgets/telas_admim/home.dart';

class TelaAdmim extends StatefulWidget {
  const TelaAdmim({super.key});

  @override
  _TelaAdmimState createState() => _TelaAdmimState();
}

class _TelaAdmimState extends State<TelaAdmim> {
  int _telaAtual = 1;

  get nome => null;

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Limpa nome salvo
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const TelaLogin()),
      (route) => false,
    );
  }

  Widget _mostrarTela() {
    switch (_telaAtual) {
      case 0:
        return Home();
      case 1:
        return CrudSala();
      case 2:
        return CrudTurma();
      case 3:
        return CrudCurso();
      case 4:
        return CrudUsuario();
      case 5:
        return Ensalamento();
      default:
        return const Center(child: Text("Tela não encontrada"));
    }
  }

  Widget _btnBar(String texto, dynamic onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Text(
          '• $texto',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _cliqueHome() {
    setState(() {
      _telaAtual = 0;
    });
  }

  void _cliqueSala() {
    setState(() {
      _telaAtual = 1;
    });
  }

  void _cliqueTurma() {
    setState(() {
      _telaAtual = 2;
    });
  }

  void _cliqueCurso() {
    setState(() {
      _telaAtual = 3;
    });
  }

  void _cliqueUsuario() {
    setState(() {
      _telaAtual = 4;
    });
  }

  void _cliqueEnsalamento() {
    setState(() {
      _telaAtual = 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Container(
            width: 180,
            color: const Color(0xffe7972a),
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Olá, fulano!',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Links
                    _btnBar('Home', _cliqueHome),
                    _btnBar('Ensalamento', _cliqueEnsalamento),
                    _btnBar('Turma', _cliqueTurma),
                    _btnBar('Usuario', _cliqueUsuario),
                    _btnBar('Curso', _cliqueCurso),
                    _btnBar('Sala', _cliqueSala),
                  ],
                ),
                Center(
                    child: IconButton(
                  icon: const Icon(Icons.logout, color: Colors.white),
                  onPressed: () => _logout(context),
                  tooltip: 'Sair',
                ))
              ],
            ),
          ),
          _mostrarTela(),
        ],
      ),
    );
  }
}
