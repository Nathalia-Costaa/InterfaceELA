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
      body: ListView.builder(
        itemCount: map.length,
        itemBuilder: (BuildContext context, int index) {
          final entry = map[index];
          bool isSelected = entry.value == TelegramAPI.caretakerId;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  TelegramAPI.caretakerId = entry.value;
                });
                print(entry.value);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.blue : Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  entry.key,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}