import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações do Comunicador'),
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
                'MENSAGENS RÁPIDAS'
              ]),
              buildButtonColumn(context, [
                'MENSAGENS DE EMERGÊNCIA'
              ]),
              buildButtonColumn(context, [
                'EMERGENCIA'
              ], isCircular: true, colors: [Colors.red])
            ],
          ),
        ),
      ),
    );
  }
}