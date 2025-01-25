import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = []; // ローカルのメッセージリスト

  // メッセージ送信
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.insert(0, {
          "user": "テストユーザー",
          "message": _controller.text,
        });
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ローカルチャット")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // 最新メッセージを下に表示
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                var messageData = _messages[index];
                return ChatMessage(
                  user: messageData["user"]!,
                  message: messageData["message"]!,
                );
              },
            ),
          ),

          // メッセージ入力欄
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "メッセージを入力...",
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
    );
  }
}

// メッセージ表示ウィジェット
class ChatMessage extends StatelessWidget {
  final String user;
  final String message;

  const ChatMessage({super.key, required this.user, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(user),
      subtitle: Text(message),
    );
  }
}
