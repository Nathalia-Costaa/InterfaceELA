import 'package:http/http.dart' as http;
import 'dart:convert';


class TelegramAPI {
  static String? caretakerId;
  static String? groupId;

  static String botToken = '6334207205:AAGGcuCd5sugzasJQEfHzbCIWZmi02sK6JA';

  static get baseUrl => 'https://api.telegram.org/bot$botToken';

  static get sendMessageApiEndPoint => '$baseUrl/sendMessage';

  static get url => '$baseUrl/getUpdates';

  static Future<bool> sendMessage(String message, String chatId) async {
    final response = await http.post(
      Uri.parse(sendMessageApiEndPoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'chat_id': chatId,
        'text': message,
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

  static Future<bool> sendMessageGroup(String text) async {
    if (groupId == null){
      return false;
    }

    return sendMessage(text, groupId!);
  }

  static Future<bool> sendMessageCaretaker(String text) async {
    if (caretakerId == null){
      return false;
    }

    return sendMessage(text, caretakerId!);
  }

  static Future<Map<String, String>?> fetchTelegramMentions() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['result'];

      Map<String, String> userConversationMap = {
        for (var update in data)
          if (update['message'] != null)
            update['message']['chat']['first_name'] ??
                update['message']['chat']['title'] ?? 'Desconhecido':
            update['message']['chat']['id'].toString()
      };

      return userConversationMap;
    }
    else {
      print('Erro ao carregar as conversas');
    }

    return null;
  }
}
