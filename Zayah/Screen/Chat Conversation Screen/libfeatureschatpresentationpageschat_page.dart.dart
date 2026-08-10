import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String roomId;
  final String title;

  const ChatPage({
    super.key,
    required this.roomId,
    required this.title,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController =
      TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();

    if (text.isEmpty) return;

    // TODO:
    // Send message using ChatCubit

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // TODO: Voice Call
            },
          ),
        ],
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(16),
              itemCount: 20,
              itemBuilder: (context, index) {
                final isMine = index.isEven;

                return Align(
                  alignment: isMine
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 6,
                    ),
                    padding: const EdgeInsets.all(12),
                    constraints: const BoxConstraints(
                      maxWidth: 280,
                    ),
                    decoration: BoxDecoration(
                      color: isMine
                          ? Colors.blue
                          : Colors.grey.shade300,
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Sample message ${index + 1}",
                      style: TextStyle(
                        color: isMine
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [

                  IconButton(
                    onPressed: () {
                      // TODO:
                      // Pick Image
                    },
                    icon: const Icon(Icons.image),
                  ),

                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: "Type a message...",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}