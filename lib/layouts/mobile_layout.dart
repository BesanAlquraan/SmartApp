import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgetss/custom_appbar.dart';
import '../../screens/chat_ai_page.dart';
import '../../screens/contact_person_page.dart';

class AdvisorMobile extends StatelessWidget {
  const AdvisorMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // الصورة
              SizedBox(
                width: screenSize.width * 0.9,
                height: screenSize.width * 0.55,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/67ee6a417cbff236e9.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // النص
              const Text(
                "Chat with AI or connect with a real advisor now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 20),

              // الأزرار
              buildButton(context, Icons.smart_toy, "Chat AI", ChatAIPage()),
              const SizedBox(height: 15),
              buildButton(
                  context, Icons.person, "Contact Person", ContactPersonPage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(
      BuildContext context, IconData icon, String label, Widget page) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => page));
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        foregroundColor: textColor,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}

class ChatAIMobile extends StatefulWidget {
  const ChatAIMobile({super.key});

  @override
  State<ChatAIMobile> createState() => _ChatAIMobileState();
}

class _ChatAIMobileState extends State<ChatAIMobile> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final List<String> _chatList = ['Chat 1', 'Chat 2', 'Chat 3'];
  String _currentChat = 'Chat 1';

  void _sendMessage() {
    String text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'type': 'user', 'message': text});
      _messages.add({'type': 'ai', 'message': 'AI Response: $text'});
    });

    _controller.clear();
  }

  void _openChatList() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ListView.builder(
        itemCount: _chatList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_chatList[index]),
          onTap: () {
            setState(() {
              _currentChat = _chatList[index];
              _messages.clear();
            });
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _mobileAppBar() {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: Text('Chat: $_currentChat'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: _openChatList,
          icon: const Icon(Icons.menu),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: _mobileAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                bool isUser = msg['type'] == 'user';
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blueAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      msg['message']!,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send, color: Colors.blue),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
