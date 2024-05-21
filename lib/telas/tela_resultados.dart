import 'package:flutter/material.dart';
import 'tela_inicial.dart';  // Certifique-se que o caminho está correto

class TelaResultados extends StatelessWidget {
  final int score;

  const TelaResultados({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você acertou $score perguntas!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navega de volta para a tela inicial, removendo todas as telas anteriores da pilha
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaInicial()),
                      (Route<dynamic> route) => false,
                );
              },
              child: const Text('Voltar para o Início'),
            ),
          ],
        ),
      ),
    );
  }
}