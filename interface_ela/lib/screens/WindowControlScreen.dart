
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:interface_ela/utils/telegram_api.dart';

class WindowControlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Janelas'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ABRIR / FECHAR JANELAS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      buildButton('ABRIR JANELA SALA', context),
                      buildButton('FECHAR JANELA COZINHA', context),
                      buildButton('FECHAR JANELA QUARTO 1', context),
                      buildButton('ABRIR JANELA QUARTO 2', context),
                    ],
                  ),
                  Column(
                    children: [
                      buildButton('ABRIR JANELA QUARTO 3', context),
                      buildButton('ABRIR LAVANDERIA', context),
                    ],
                  ),
                  Column(
                    children: [
                      buildCircularButton('EMERGENCIA', diameter: 150, color: Colors.red, context: context),
                      buildButton('PÁGINA INICIAL', context),
                      buildButton('CONFIGURAÇÕES', context),
                    ],
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
          if (text == 'PÁGINA INICIAL') {
            Navigator.pop(context);
          }
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }

  Widget buildCircularButton(String text, {double diameter = 100, Color color = Colors.red, required BuildContext context}) {
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
          Dio().post(
            'https://api.telegram.org/bot6334207205:AAGGcuCd5sugzasJQEfHzbCIWZmi02sK6JA/sendMessage',
            data: {
              'chat_id': '5516338034',
              'text': 'Preciso de ajuda'
            }
          );
          TelegramAPI.sendMessage('Socorro');
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
