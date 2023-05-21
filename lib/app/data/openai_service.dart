import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String apiKey;
  final String apiUrl =
      'https://api.openai.com/v1/engines/davinci-codex/completions';

  OpenAIService({required this.apiKey});

  Future<String> getAIResponse(String prompt) async {
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey'
      },
      body: json.encode({
        "prompt": prompt,
        "temperature": 0.7,
        "max_tokens": 60,
        "top_p": 1.0,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0,
        "stop": ["\n"]
      }),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var choices = data['choices'];
      if (choices != null && choices.isNotEmpty) {
        return choices[0]['text'];
      }
    }
    return '';
  }
}
