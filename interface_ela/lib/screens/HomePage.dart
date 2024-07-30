import 'package:flutter/material.dart';

import '../main.dart';
import 'CommunicatorScreen.dart';
import 'WindowControlScreen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página inicial'),
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
              // Primeira coluna
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('ABRIR JANELA', context),
                  buildButton('CONTROLE DE LUZ', context),
                  buildButton('ABRIR JANELA', context),
                  buildButton('LIGAR AR CONDICIONADO', context),
                  buildButton('LIGAR VENTILADOR', context),
                ],
              ),
              // Segunda coluna
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildMessageButton('ESTOU BEM', context),
                  buildMessageButton('ESTOU COM FOME', context),
                  buildMessageButton('ESTOU COM DOR', context),
                  buildButton('COMUNICADOR', context),
                  buildButton('ENTRETENIMENTO', context),
                ],
              ),
              // Terceira coluna
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('CONFIGURAÇÕES', context, width: 400),
                  buildCircularButton(
                    'EMERGENCIA',
                    diameter: 300,
                    color: Colors.red,
                    context: context,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String text, BuildContext context, {double width = 300, double height = 100, Color color = Colors.purple}) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        onPressed: () {
          if (text == 'ABRIR JANELA') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WindowControlScreen()),
            );
          } else if (text == 'COMUNICADOR') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommunicatorScreen()),
            );
          }
          // Handle other button presses here
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget buildMessageButton(String text, BuildContext context, {double width = 300, double height = 100, Color color = Colors.purple}) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.purple.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                content: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'MENSAGEM ENVIADA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget buildCircularButton(String text, {double diameter = 200, Color color = Colors.red, context}) {
    return Container(
      width: diameter,
      height: diameter,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: CircleBorder(),
        ),
        onPressed: () {
          if (text == 'EMERGENCIA') {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.purple.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  content: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PEDIDO DE AJUDA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'ENVIADO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
