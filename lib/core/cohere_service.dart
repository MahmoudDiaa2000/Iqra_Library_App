import 'dart:convert';

import 'package:http/http.dart' as http;

class CohereService {
  static const _apiKey = 'El6Ptls6m4DdmsKmDIWLZRuI5lHeqMPgWkirnXWH';
  static const _url = 'https://api.cohere.ai/v2/chat';

  static Future<String> askAI(String title, String? description) async {
    if (title.trim().isEmpty) {
      return 'Invalid book title.';
    }

    // if (description == null || description.trim().length < 20) {
    //   return '⚠️ This book does not have enough description to analyze.';
    // }

    // final descriptionPrompt = (description != null && description.trim().isNotEmpty)
    //     ? '📝 **Description:** "$description"'
    //     : '⚠️ No description is provided. Try your best to infer based on the title alone.';

    final message = '''
You're an expert book assistant. Help the reader understand and engage with the following book:

📘 **Title:** "$title"
${description != null && description.trim().isNotEmpty ? '📝 **Description:** "$description"' : '⚠️ No description is provided. Try your best to infer based on the title alone.'}

Please answer the following 3 points clearly and concisely:

1. **Target Audience:** Who would benefit most from reading this book?
2. **Complementary Book:** Mention a well-known book that complements this one, and briefly explain how.
3. **Summary:** Summarize the key idea of this book in 2-3 lines.

Structure your response using numbered points and avoid extra commentary.
''';

    try {
      final response = await http
          .post(
            Uri.parse(_url),
            headers: {
              'Authorization': 'Bearer $_apiKey',
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({
              "model": "command-r",
              "messages": [
                {"role": "user", "content": message},
              ],
            }),
          )
          .timeout(const Duration(seconds: 12));

      final data = jsonDecode(response.body);
      print('COHERE FULL RESPONSE: ${response.body}');

      final text = data['message']?['content']?[0]?['text'];
      if (text != null && text.toString().trim().isNotEmpty) {
        return text.toString().trim();
      } else {
        return '⚠️ Sorry, I couldn\'t generate a response for this book. Try another one with more description.';
      }
    } catch (e) {
      print('Cohere API error: $e');
      return 'An error occurred while connecting to Cohere.';
    }
  }

  static Future<String> analyzePodcast(
    String title,
    String? description,
  ) async {
    final message = '''
You're an intelligent podcast summarizer. Help the user understand what this podcast episode is about.

🎙️ **Podcast Title:** "$title"
${description != null && description.trim().isNotEmpty ? '📝 **Description:** "$description"' : '⚠️ No description is provided. Try to infer based on the title alone.'}

Please provide a short and informative summary of the episode in **2 to 3 concise sentences**.
Avoid unnecessary introduction or outro commentary.
''';

    try {
      final response = await http.post(
        Uri.parse(_url),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "model": "command-r",
          "messages": [
            {"role": "user", "content": message},
          ],
        }),
      );

      final data = jsonDecode(response.body);
      print('COHERE PODCAST RESPONSE: ${response.body}');

      final text = data['message']?['content']?[0]?['text'];
      if (text != null && text.toString().trim().isNotEmpty) {
        return text.toString().trim();
      } else {
        return 'No insight could be generated for this podcast.';
      }
    } catch (e) {
      print('Cohere Podcast API error: $e');
      return 'Error analyzing podcast.';
    }
  }
}
