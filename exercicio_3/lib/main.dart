import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

void main() async {

  // Garantir que os bindings do Flutter estejam inicializados
  WidgetsFlutterBinding.ensureInitialized();

  
  // Carregar o JSON do arquivo
  String jsonString = await loadJson();
  
  // Convertendo o JSON para uma lista de mapas (equivalente a objetos)
  List faturamento = json.decode(jsonString);

  // Calcular o menor, maior e o número de dias com faturamento acima da média
  double menorValor = double.infinity;
  double maiorValor = double.negativeInfinity;
  double somaFaturamento = 0.0;
  int diasComFaturamentoValido = 0;
  int diasAcimaDaMedia = 0;

  // Iterar pelos dados do faturamento
  for (var item in faturamento) {
    double valor = item['valor'];
    
    // Ignorar dias sem faturamento
    if (valor > 0) {
      somaFaturamento += valor;
      diasComFaturamentoValido++;

      // Verificar menor e maior valor de faturamento
      if (valor < menorValor) menorValor = valor;
      if (valor > maiorValor) maiorValor = valor;
    }
  }

  // Calcular a média
  double mediaFaturamento = somaFaturamento / diasComFaturamentoValido;

  // Contar os dias com faturamento acima da média
  for (var item in faturamento) {
    double valor = item['valor'];
    if (valor > mediaFaturamento) {
      diasAcimaDaMedia++;
    }
  }

  runApp(MyApp(
    menorValor: menorValor,
    maiorValor: maiorValor,
    diasAcimaDaMedia: diasAcimaDaMedia,
  ));
}

// Função para carregar o arquivo JSON
Future<String> loadJson() async {
  return await rootBundle.rootBundle.loadString('assets/dados.json');
}

class MyApp extends StatelessWidget {

  final double menorValor;
  final double maiorValor;
  final int diasAcimaDaMedia;

  MyApp({
    required this.menorValor,
    required this.maiorValor,
    required this.diasAcimaDaMedia,
  });

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Faturamento Mensal'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Menor valor de faturamento: \$${menorValor.toStringAsFixed(2)}'),
              SizedBox(height: 8),
              Text('Maior valor de faturamento: \$${maiorValor.toStringAsFixed(2)}'),
              SizedBox(height: 8),
              Text('Número de dias com faturamento acima da média: $diasAcimaDaMedia'),
            ],
          ),
        ),
      ),
    );
  }
}


