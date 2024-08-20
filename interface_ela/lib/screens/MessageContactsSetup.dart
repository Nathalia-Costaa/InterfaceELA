import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageContactsSetup extends StatelessWidget {
  const MessageContactsSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensagens Rápidas'),
        backgroundColor: Colors.deepOrange,
      ),
      body: const Center(
        child: Text('Conteúdo de Mensagens Rápidas'),
      ),
    );
  }
}