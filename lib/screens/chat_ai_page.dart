import '../layouts/desktop_layout.dart';
import '../layouts/mobile_layout.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ChatAIPage extends StatelessWidget {
  const ChatAIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return const ChatAIMobile();
        } else {
          return const ChatAIDesktop();
        }
      },
    );
  }
}