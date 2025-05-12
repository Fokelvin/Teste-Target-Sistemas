import 'package:flutter/material.dart';

void main() {
  runApp(PercentualFaturamentoApp());
}

class PercentualFaturamentoApp extends StatelessWidget {
  
  final Map<String, double> faturamentoPorEstado = {
    'SP': 67836.43,
    'RJ': 36678.66,
    'MG': 29229.88,
    'ES': 27165.48,
    'Outros': 19849.53,
  };

  @override
  Widget build(BuildContext context) {
    double total = faturamentoPorEstado.values.reduce((a, b) => a + b);

    print("O valor total do double é: $total");

    Map<String, String> percentuais = {
      for (var entry in faturamentoPorEstado.entries)
      //Regra de 3 para ver o percentual de cada estado
        entry.key: ((entry.value / total) * 100).toStringAsFixed(2)
    };

    print("O percentual de cada estado é: $percentuais");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Percentual por Estado'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Faturamento Total: R\$ ${total.toStringAsFixed(2)}'),
              SizedBox(height: 16),
              ...percentuais.entries.map((e) => Text('${e.key}: ${e.value}%')),
            ],
          ),
        ),
      ),
    );
  }
}
