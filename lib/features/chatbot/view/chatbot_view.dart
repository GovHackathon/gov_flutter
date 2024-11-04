import 'package:flutter/material.dart';
import 'package:gov_hackathon/core/resources/colors.dart';
import 'package:gov_hackathon/core/services/openai_service.dart';

class ChatbotView extends StatefulWidget {
  const ChatbotView({super.key});

  @override
  State<ChatbotView> createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<ChatbotView> {
  final OpenAIService openAIService = OpenAIService();
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];

  void _sendMessage() async {
    final text = _controller.text;
    if (text.isNotEmpty) {
      setState(() {
        messages.add({'sender': 'user', 'text': text});
      });
      _controller.clear();

      final response = await openAIService.generateResponse(text);
      setState(() {
        messages.add({'sender': 'bot', 'text': response.trim()});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: message['sender'] == 'user'
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: message['sender'] == 'user'
                                ? GovColors.colorPrimary
                                : GovColors.colorGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            message['text'] ?? '',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Enter your message',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
