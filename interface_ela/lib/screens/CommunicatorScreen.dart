import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunicatorScreen extends StatefulWidget {
  const CommunicatorScreen({super.key});

  @override
  _CommunicatorScreenState createState() => _CommunicatorScreenState();
}

class _CommunicatorScreenState extends State<CommunicatorScreen> {
  final TextEditingController _controller = TextEditingController();

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
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: 'Digite sua mensagem aqui...',
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 20),
              buildKeyboard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildKeyboard() {
    final keys = [
      'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P',
      'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L',
      'Z', 'X', 'C', 'V', 'B', 'N', 'M', ' ',
    ];

    return Wrap(
      spacing: 20.0,
      runSpacing: 20.0,
      children: keys.map((key) => buildKey(key)).toList(),
    );
  }

  Widget buildKey(String key) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _controller.text += key;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        padding: EdgeInsets.symmetric(vertical: 45, horizontal: 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Text(
        key,
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }
}
