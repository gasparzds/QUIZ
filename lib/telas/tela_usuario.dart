import 'package:flutter/material.dart';
import 'package:jogo_do_quiz/telas/tela_quiz.dart';

class TelaUsuario extends StatefulWidget {
  const TelaUsuario({super.key});

  @override
  _TelaUsuarioState createState() => _TelaUsuarioState();
}

class _TelaUsuarioState extends State<TelaUsuario> {
  TextEditingController nomeController = TextEditingController();
  bool isNomeButtonEnabled = false; // Controle do estado de habilitação do botão de gravar nome

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar com seu nome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
                hintText: 'Digite seu nome aqui',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isNomeButtonEnabled
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaQuiz(userName: nomeController.text)),
                );
              }
                  : null, // Botão desabilitado se isNomeButtonEnabled for false
              child: Text('Gravar Nome'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Habilita o botão de Gravar Nome quando este botão é clicado
                setState(() {
                  isNomeButtonEnabled = true;
                });
                print("Botão de gravar localização clicado");
              },
              child: Text('PERMITIR ACESSO A MINHA LOCALIZAÇÃO'),
            ),
          ],
        ),
      ),
    );
  }
}