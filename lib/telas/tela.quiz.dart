import 'package:flutter/material.dart';
import 'package:jogo_do_quiz/telas/tela_resultados.dart';


class TelaQuiz extends StatelessWidget {
  final String userName;

  const TelaQuiz({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz em Andamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Olá, $userName! Bem-vindo ao quiz.', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text('Primeira Pergunta: Quem descobriu o Brasil?', style: TextStyle(fontSize: 18)),
            ...['Pedro Álvares Cabral', 'Cristóvão Colombo', 'Amerigo Vespucci', 'Vasco da Gama']
                .map((answer) => ListTile(
              title: Text(answer),
              onTap: () {},
            )),
            const SizedBox(height: 20),
            Text('Segunda Pergunta: Qual é a capital do Brasil?', style: TextStyle(fontSize: 18)),
            ...['São Paulo', 'Rio de Janeiro', 'Brasília', 'Salvador']
                .map((answer) => ListTile(
              title: Text(answer),
              onTap: () {},
            )),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 30),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaResultados()),
                );
              },
              child: const Text('RESULTADO'),
            ),
          ],
        ),
      ),
    );
  }
}