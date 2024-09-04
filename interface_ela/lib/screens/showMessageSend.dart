import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showMessageSend(BuildContext context) {
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
                'MENSAGEM ENVIADA',
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