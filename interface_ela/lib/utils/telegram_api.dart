import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TelegramAPI {
  Map<String, String> _userConversationMap = {};
  static String botToken = '6334207205:AAGGcuCd5sugzasJQEfHzbCIWZmi02sK6JA';

  static get baseUrl => 'https://api.telegram.org/bot$botToken';
  static get sendMessageApiEndPoint => '$baseUrl/sendMessage';
  static get url => '$baseUrl/getUpdates';

  static void sendMessage(String message) {
    Dio().post(
        sendMessageApiEndPoint,
        data: {
          'chat_id': '-4224483795',
          'text': message
        }
    );
  }

  static Future<bool> sendMessageGroup(String text) async {
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
      return true;
    } else {
      print('Falha ao enviar mensagem: ${response.body}');
      return false;
    }
  }

  static Future<bool> sendMessageCaretaker(String text) async {
    final response = await http.post(
      Uri.parse(sendMessageApiEndPoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'chat_id': '5516338034',
        'text': text,
      }),
    );
    if (response.statusCode == 200) {
      print('Mensagem enviada com sucesso!');
      return true;
    } else {
      print('Falha ao enviar mensagem: ${response.body}');
      return false;
    }
  }

  Future<void> _fetchTelegramMentions() async {
    final url = 'https://api.telegram.org/bot6334207205:AAGGcuCd5sugzasJQEfHzbCIWZmi02sK6JA/getUpdates';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['result'];
      print(data);
      setState(() {
        _userConversationMap = {
          for (var update in data)
            if (update['message'] != null)
              update['message']['chat']['first_name'] ??
                  update['message']['chat']['title'] ?? 'Desconhecido':
              update['message']['chat']['id'].toString()
        };
      });
      print(_userConversationMap);
    } else {
      // Trate o erro
      print('Erro ao carregar as conversas');
    }
  }
}
