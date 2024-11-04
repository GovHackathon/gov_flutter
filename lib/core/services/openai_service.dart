import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String apiKey = dotenv.env['API_KEY']!;
  final String endpoint = dotenv.env['ENDPOINT']!;

  Future<String> generateResponse(String prompt) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'api-key': apiKey,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "messages": [
          {
            "role": "system",
            "content": [
              {
                "type": "text",
                "text": prompt,
              }
            ]
          }
        ],
        "temperature": 0.7,
        "top_p": 0.95,
        "max_tokens": 800
      }),
    );

    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        throw Exception(response.body.toString());
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }
}
