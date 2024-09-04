import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class CommunicatorScreen extends StatelessWidget {
  const CommunicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comunicador'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButtonColumn(context, [
                'ESTOU BEM',
                'ESTOU COM FOME',
                'ESTOU COM DOR'
              ]),
              buildButtonColumn(context, [
                'PRECISO DE AJUDA',
                'PRECISO DE COMPANHIA',
                'PRECISO DE MEDICAMENTO'
              ]),
              buildButtonColumn(context, [
                'PÁGINA INICIAL',
                'CONFIGURAÇÕES\n'
                'COMUNICADOR',
                'EMERGENCIA'
              ], isCircular: true, colors: [Colors.yellow, Colors.blue, Colors.red])
            ],
          ),
        ),
      ),
    );
  }
}