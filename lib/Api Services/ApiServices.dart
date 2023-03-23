import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<String?> SendMessage({required String message}) async {
    var response = await http.post(
      Uri.parse("https://api.openai.com/v1/chat/completions"),
      headers: {
        'Authorization':
            'Bearer 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',
        "Content-Type": "application/json",
      },
      body: jsonEncode(
        {
          "model": "gpt-3.5-turbo-0301",
          "messages": [
            {
              "role": "user",
              "content": message,
            }
          ]
        },
      ),
    );
    Map json = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return json["choices"][0]["message"]["content"];
    }
  }
}
