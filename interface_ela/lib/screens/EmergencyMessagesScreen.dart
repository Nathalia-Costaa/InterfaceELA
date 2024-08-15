import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmergencyMessagesScreen extends StatelessWidget {
  const EmergencyMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensagens de Emergência'),
        backgroundColor: Colors.deepOrange,
      ),
      body: const Center(
        child: Text('Conteúdo de Mensagens de Emergência'),
      ),
    );
  }
}