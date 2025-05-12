import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercicio 1'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Soma(),
        ),
      ),
    );
  }
}

class Soma extends StatelessWidget {
  const Soma({super.key});

int calcularSoma() {
    int INDICE = 13;
    int SOMA = 0;
    int K = 0;

    while (K < INDICE) {
      K = K + 1;
      SOMA = SOMA + K;
  }
  return SOMA;
  }

  @override
  Widget build(BuildContext context) {
    int result = calcularSoma();
    return Center(
      child: Text('A SOMA é: $result',
      style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
