import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: InverterStringApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class InverterStringApp extends StatefulWidget {
  const InverterStringApp({super.key});

  @override
  State<InverterStringApp> createState() => _InverterStringAppState();
}

class _InverterStringAppState extends State<InverterStringApp> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = '';

  String inverterString(String texto) {
    String invertida = '';
    for (int i = texto.length - 1; i >= 0; i--) {
      invertida += texto[i];
    }
    return invertida;
  }

  void _processar() {
    String entrada = _controller.text;
    String invertida = inverterString(entrada);
    setState(() {
      _resultado = invertida;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inverter String')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Digite uma string'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _processar,
              child: const Text('Inverter'),
            ),
            const SizedBox(height: 24),
            Text(
              'Resultado: $_resultado',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
