import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TelegramAPI {
  static String botToken = '6334207205:AAGGcuCd5sugzasJQEfHzbCIWZmi02sK6JA';

  static get baseUrl => 'https://api.telegram.org/bot$botToken';
  static get sendMessageApiEndPoint => '$baseUrl/sendMessage';
  static get getUpdatesApiEndPoint => '$baseUrl/getUpdates';

  static void sendMessage(String message) {
    Dio().post(
        sendMessageApiEndPoint,
        data: {
          'chat_id': '-4224483795',
          'text': message
        }
    );
  }

  static Future<void> sendMessage2(String text) async {
    final response = await http.post(
      Uri.parse(sendMessageApiEndPoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'chat_id': '-4224483795',
        'text': text,
      }),
    );

    if (response.statusCode == 200) {
      print('Mensagem enviada com sucesso!');
    } else {
      print('Falha ao enviar mensagem: ${response.body}');
    }
  }

  void getUpdates() async {
    final response = await http.get(
      Uri.parse(getUpdatesApiEndPoint),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<int> chatIds = [];

      for (var result in data['result']) {
        final chatId = result['message']['chat']['id'];
        if (!chatIds.contains(chatId)) {
          chatIds.add(chatId);
        }
      }

      print('IDs dos Chats: $chatIds');
    } else {
      print('Falha ao obter atualizações: ${response.statusCode}');
    }
  }

}
