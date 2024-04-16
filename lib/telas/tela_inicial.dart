import 'package:flutter/material.dart';
import 'package:jogo_do_quiz/telas/tela_instrucoes.dart';
import 'package:jogo_do_quiz/telas/tela_usuario.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/telainicial.jpeg'),
            fit: BoxFit.cover, // Cobrir todo o espaço disponível
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 30),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TelaUsuario()),
                  );
                }, // Adicione a lógica de navegação aqui
                child: const Text('ESTOU PREPARADO!'),
              ),
              SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white ,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TelaInstrucoes()),
                  );
                }, // Adicione a lógica de navegação para instruções
                child: const Text('INSTRUÇÕES'),
              ),
              SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 10),
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("SAIR"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}