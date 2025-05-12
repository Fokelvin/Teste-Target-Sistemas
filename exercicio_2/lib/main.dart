import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FibonacciChecker(),
    );
  }
}

class FibonacciChecker extends StatefulWidget {
  const FibonacciChecker({super.key});

  @override
  State<FibonacciChecker> createState() => _FibonacciCheckerState();
}

class _FibonacciCheckerState extends State<FibonacciChecker> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = '';

  bool pertenceAFibonacci(int numero) {
    int a = 0, b = 1;
    while (b < numero) {
      int temp = b;
      b = a + b;
      a = temp;
    }
    return numero == b || numero == 0;
  }

  void verificarNumero() {
    final entrada = int.tryParse(_controller.text);
    if (entrada == null) {
      setState(() {
        _resultado = 'Por favor, insira um número válido.';
      });
      return;
    }

    final pertence = pertenceAFibonacci(entrada);
    setState(() {
      _resultado = pertence
          ? 'O número $entrada pertence à sequência de Fibonacci.'
          : 'O número $entrada NÃO pertence à sequência de Fibonacci.';
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificar Fibonacci'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Digite um número:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Número',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: verificarNumero,
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 20),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
