import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../constants/colors.dart';   // ← الاستيراد الصحيح

class AdvisorPage extends StatefulWidget {
  const AdvisorPage({super.key});

  @override
  State<AdvisorPage> createState() => _AdvisorPageState();
}

class _AdvisorPageState extends State<AdvisorPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'assets/videos/xJ9B487B59DKI59kOb.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,   // ← الخلفية تم ضبطها هنا
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
              _controller.value.isInitialized
                  ? SizedBox(
                      width: 250,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : const CircularProgressIndicator(),

              const SizedBox(height: 30),

              const Text(
                "Get advice from AI or connect with a real person!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChatAIPage()),
                      );
                    },
                    icon: const Icon(Icons.smart_toy),
                    label: const Text("Chat AI"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPersonPage()),
                      );
                    },
                    icon: const Icon(Icons.person),
                    label: const Text("Contact Person"),
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
