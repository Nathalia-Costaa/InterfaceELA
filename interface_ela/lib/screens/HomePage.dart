import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_ela/screens/showMessageSend.dart';
import 'package:interface_ela/utils/telegram_api.dart';

import 'CommunicatorScreen.dart';
import 'EmergencyMessagesSetup.dart';
import 'MessageContactsSetup.dart';
import 'SettingsScreen.dart';
import 'WindowControlScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              buildButtonColumn(context, [
                'ABRIR JANELAS',
                'CONTROLE DE LUZ',
                'LIGAR AR CONDICIONADO'
              ]),
              buildButtonColumn(context, [
                'LIGAR VENTILADOR',
                'COMUNICADOR',
                'ENTRETENIMENTO'
              ]),
              buildButtonColumn(context, [
                'CONFIGURAÇÕES',
                'EMERGENCIA'
              ], isCircular: true, colors: [Colors.blue, Colors.red])
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildButtonColumn(BuildContext context, List<String> labels, {bool isCircular = false, List<Color>? colors}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: labels.asMap().entries.map((entry) {
      int index = entry.key;
      String label = entry.value;
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: isCircular
              ? buildCircularButton(label, context, color: colors?[index] ?? Colors.red)
              : buildButton(label, context),
        ),
      );
    }).toList(),
  );
}

Widget buildButton(String text, BuildContext context, {double width = 400, double height = 75, Color color = Colors.purple}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      onPressed: () => handleButtonPress(text, context),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}


Widget buildCircularButton(String text, BuildContext context, {double diameter = 200, Color color = Colors.red}) {
  return Container(
    width: diameter,
    height: diameter,
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const CircleBorder(),
      ),
      onPressed: () => handleButtonPress(text, context),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  );
}

void handleButtonPress(String text, BuildContext context) {
  switch (text) {
    case 'ABRIR JANELAS':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WindowControlScreen()),
      );
      break;
    case 'COMUNICADOR':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CommunicatorScreen()),
      );
      break;
    case 'CONFIGURAÇÕES COMUNICADOR':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsScreen()),
      );
      break;
    case 'EMERGENCIA':
      TelegramAPI.sendMessageGroup('----- Preciso de ajuda, emergencia!!! -----').then((success) {
        if (success) {
          showEmergencyDialog(context);
        }
      });
      break;
    case 'MENSAGENS RÁPIDAS':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MessageContactsSetup()),
      );
      break;
    case 'ESTOU COM FOME':
      TelegramAPI.sendMessageCaretaker("Estou com fome").then((success){
        if (success){
          showMessageSend(context);
        }
      });
      break;
    case 'ESTOU BEM':
      TelegramAPI.sendMessageCaretaker("Estou bem").then((success){
        if (success){
          showMessageSend(context);
        }
      });
      break;
    case 'ESTOU COM DOR':
      TelegramAPI.sendMessageCaretaker("Estou com dor").then((success){
        if (success){
          showMessageSend(context);
        }
      });
      break;
    case 'PRECISO DE AJUDA':
      TelegramAPI.sendMessageCaretaker("Preciso de ajuda").then((success){
        if (success){
          showMessageSend(context);
        }
      });
      break;
    case 'PRECISO DE COMPANHIA':
      TelegramAPI.sendMessageCaretaker("Preciso de companhia").then((success){
        if (success){
          showMessageSend(context);
        }
      });
      break;
    case 'PRECISO DE MEDICAMENTO':
      TelegramAPI.sendMessageCaretaker("Preciso de medicamentos").then((success){
        if (success){
          showMessageSend(context);
        }
      });
      break;
    case 'MENSAGENS DE EMERGÊNCIA':
      TelegramAPI.fetchTelegramMentions();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EmergencyMessagesSetup()),
      );

      break;
    case 'MENSAGENS RAPIDAS':
      TelegramAPI.fetchTelegramMentions();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MessageContactsSetup()),
      );
      break;
    default:
    // Lógica padrão, se necessário
      break;
  }
}


void showEmergencyDialog(BuildContext context) {
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
          padding: const EdgeInsets.all(20.0),
          child: const Column(
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