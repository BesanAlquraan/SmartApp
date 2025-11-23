import 'package:flutter/material.dart';

class AdvisorPage extends StatelessWidget {
  const AdvisorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advisor'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // أيقونة أو صورة كبيرة
              Icon(
                Icons.person_outline, // ممكن تغيريها لأي أيقونة أخرى
                size: 150,
                color: Colors.blueGrey,
              ),
              const SizedBox(height: 30),
              
              // الجملة المناسبة
              const Text(
                "Get advice from AI or connect with a real person!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              
              // الأزرار
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // افتح صفحة Chat AI
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChatAIPage()),
                      );
                    },
                    icon: const Icon(Icons.smart_toy),
                    label: const Text("Chat AI"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      // افتح صفحة التواصل مع شخص
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPersonPage()),
                      );
                    },
                    icon: const Icon(Icons.person),
                    label: const Text("Contact Person"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// صفحات وهمية للتجربة
class ChatAIPage extends StatelessWidget {
  const ChatAIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat AI")),
      body: const Center(child: Text("This is Chat AI page")),
    );
  }
}

class ContactPersonPage extends StatelessWidget {
  const ContactPersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Person")),
      body: const Center(child: Text("This is Contact Person page")),
    );
  }
}
