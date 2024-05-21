import 'package:flutter/material.dart';
import 'package:jogo_do_quiz/database/Database.dart';  // Ajuste conforme seu caminho
import 'package:jogo_do_quiz/telas/tela_resultados.dart';

class TelaQuiz extends StatefulWidget {
  final String userName;

  const TelaQuiz({super.key, required this.userName});

  @override
  _TelaQuizState createState() => _TelaQuizState();
}

class _TelaQuizState extends State<TelaQuiz> {
  late Future<List<Pergunta>> futurePerguntas;
  List<int>? userAnswers;  // Agora é um membro da classe de estado e opcional

  @override
  void initState() {
    super.initState();
    futurePerguntas = DatabaseHelper.instance.getPerguntas();
    futurePerguntas.then((perguntas) {
      setState(() {
        userAnswers = List.filled(perguntas.length, -1);  // Inicializa com -1 uma vez que perguntas são carregadas
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz em Andamento'),
      ),
      body: FutureBuilder<List<Pergunta>>(
        future: futurePerguntas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error.toString()}'));
            }
            if (snapshot.hasData && userAnswers != null) {
              final perguntas = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: perguntas.length,
                      itemBuilder: (context, index) {
                        final pergunta = perguntas[index];
                        return ListTile(
                          title: Text(pergunta.enunciado),
                          subtitle: Column(
                            children: List<Widget>.generate(
                                pergunta.respostas.length,
                                    (i) => RadioListTile<int>(
                                  value: i,
                                  groupValue: userAnswers![index],
                                  onChanged: (int? value) {
                                    setState(() {
                                      userAnswers![index] = value!;
                                    });
                                  },
                                  title: Text(pergunta.respostas[i]),
                                )
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      int score = 0;
                      for (int i = 0; i < perguntas.length; i++) {
                        if (userAnswers![i] == perguntas[i].respostaCorretaIndex) {
                          score++;
                        }
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaResultados(score: score)),
                      );
                    },
                    child: const Text('Submit Quiz'),
                  )
                ],
              );
            }
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
