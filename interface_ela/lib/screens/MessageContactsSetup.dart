import 'package:flutter/material.dart';
import 'package:interface_ela/utils/telegram_api.dart';

class MessageContactsSetup extends StatefulWidget {
  const MessageContactsSetup({super.key});

  @override
  State<MessageContactsSetup> createState() => _MessageContactsSetupState();
}

class _MessageContactsSetupState extends State<MessageContactsSetup> {
  List<MapEntry<String, String>> map = [];

  @override
  void initState() {
    TelegramAPI.fetchTelegramMentions().then((result) {
      if (result == null) {
        return;
      }

      setState(() {
        map = result.entries.toList();
      });
    });

    super.initState();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Mensagens Rápidas'),
      backgroundColor: Colors.deepOrange,
    ),
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.red],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: map.length,  // 'map' é uma lista de MapEntry
          itemBuilder: (BuildContext context, int index) {
            final entry = map[index];  // Acessando diretamente a lista de MapEntry
            bool isSelected = entry.value == TelegramAPI.caretakerId;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: SizedBox(
                  width: 400,
                  height: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        TelegramAPI.caretakerId = entry.value;
                      });
                      print(entry.value);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? Colors.blue : Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Text(
                        entry.key,
                        style: const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}
}