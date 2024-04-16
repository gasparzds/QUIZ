import 'package:flutter/material.dart';
import 'package:jogo_do_quiz/telas/tela_inicial.dart';

class TelaResultados extends StatelessWidget {
  const TelaResultados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    MaterialPageRoute(builder: (context) => const TelaInicial()),
                  );
                },
                child: const Text('SEU RESULTADO FOI..... '
                        '..... COMEÇAR NOVAMENTE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}