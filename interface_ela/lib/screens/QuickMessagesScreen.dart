import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickMessagesScreen extends StatelessWidget {
  const QuickMessagesScreen({super.key});

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