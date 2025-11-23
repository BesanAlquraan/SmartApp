import 'package:flutter/material.dart';

class TestimonialWidget extends StatefulWidget {
  const TestimonialWidget({super.key});

  @override
  State<TestimonialWidget> createState() => _TestimonialWidgetState();
}

class _TestimonialWidgetState extends State<TestimonialWidget> {
  String currentText = "Very well done, polished, and makes tasks a bit more fun.";

  final Map<String, String> quotes = {
    "Budget": "Helps you track your spending and manage your monthly finances with clarity.",
    "Forecast": "Provides future financial predictions so you can plan ahead confidently.",
    "Savings": "Smart saving tools designed to help you reach your financial goals faster.",
    "Analytics": "Clear visual insights that guide your financial decisions effectively.",
    "Security": "Your data is fully encrypted and protected with top-level security.",
    "Expenses": "Easily record your daily expenses to understand your spending habits.",
    "Smart Tips": "Personalized advice to help you improve your financial lifestyle.",
  };

  String hovered = "";

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 22, 46, 71),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Our system empowers users to plan, track, and achieve their financial goals with ease.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            '"$currentText"',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: quotes.keys.map((word) {
              final isHovered = hovered == word;
              return MouseRegion(
                onEnter: (_) => setState(() => hovered = word),
                onExit: (_) => setState(() => hovered = ""),
                child: GestureDetector(
                  onTap: () => setState(() => currentText = quotes[word]!),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: isHovered ? Colors.white : Colors.white30,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      word,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 22, 46, 71),
                        fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
