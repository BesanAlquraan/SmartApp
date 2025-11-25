import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgetss/custom_appbar.dart';
import '../../screens/chat_ai_page.dart';
import '../../screens/contact_person_page.dart';

class AdvisorDesktop extends StatelessWidget {
  const AdvisorDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isMobile = screenSize.width < 800;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: isMobile ? 30 : 60,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// الصورة الكبيرة
              SizedBox(
                width: isMobile ? screenSize.width * 0.9 : 600,
                height: isMobile ? screenSize.width * 0.6 : 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/67ee6a417cbff236e9.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// النص
              Text(
                "Chat with AI or connect with a real advisor now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 20 : 26,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 20),

              /// الأزرار (Row للموبايل الكبيرة، Column للموبايل الصغيرة)
              isMobile
                  ? Column(
                      children: [
                        _buildButton(
                            context, Icons.smart_toy, "Chat AI", ChatAIPage()),
                        const SizedBox(height: 15),
                        _buildButton(context, Icons.person, "Contact Person",
                            ContactPersonPage()),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton(
                            context, Icons.smart_toy, "Chat AI", ChatAIPage()),
                        const SizedBox(width: 25),
                        _buildButton(context, Icons.person, "Contact Person",
                            ContactPersonPage()),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  /// دالة لتوليد زر موحد
  Widget _buildButton(
      BuildContext context, IconData icon, String label, Widget page) {
    return ElevatedButton.icon(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => page)),
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        foregroundColor: textColor,
        backgroundColor: Colors.white,
      ),
    );
  }
}








class ChatAIDesktop extends StatefulWidget {
  const ChatAIDesktop({super.key});

  @override
  State<ChatAIDesktop> createState() => _ChatAIDesktopState();
}

class _ChatAIDesktopState extends State<ChatAIDesktop> {
  bool showChatList = true; // true = تظهر، false = تختفي

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat AI Desktop'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: Icon(
              showChatList ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                showChatList = !showChatList;
              });
            },
            tooltip: showChatList ? 'Hide Chat List' : 'Show Chat List',
          ),
        ],
      ),
      body: Row(
        children: [
          // قائمة المحادثات الجانبية
          if (showChatList)
            Container(
              width: 250,
              color: Colors.grey[200],
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.blueGrey,
                    child: const Text(
                      'Chat List',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: List.generate(
                        10,
                        (index) => ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text('User $index'),
                          subtitle: const Text('Last message preview...'),
                          onTap: () {
                            // يمكن إضافة فتح المحادثة هنا
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // نافذة المحادثة الرئيسية
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Chat Window',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.02,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.grey[100],
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Type a message...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Icon(Icons.send),
                        ),
                      ],
                    ),
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






  