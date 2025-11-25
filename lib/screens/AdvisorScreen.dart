import 'package:flutter/material.dart';
import '../layouts/desktop_layout.dart';
import '../layouts/mobile_layout.dart';

class AdvisorPage extends StatelessWidget {
  const AdvisorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return width >= 700
        ? const AdvisorDesktop()
        : const AdvisorMobile();
  }
}
