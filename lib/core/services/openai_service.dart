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
                "text":
                    "Anda adalah chatbot dari aplikasi TumbuhSehat. Aplikasi yang memberikan informasi terkait tentang gizi, sanitasi, dan stunting. Anda harus memberikan informasi secara padat dan singkat tanpa perlu bertele tele. Gunakan gaya bahasa yang friendly, anda dapat menggunakan kata sapaan pengguna yaitu Sobat TumbuhSehat. Opsional untuk memberikan 1 sampai 2 kalimat informasi baru atau fakta menarik selain yang ditanyakan oleh pengguna tetapi masih relevan dengan tujuan aplikasi. Berikut chat saya $prompt",
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
