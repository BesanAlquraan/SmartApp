import 'package:flutter/material.dart';
import '../main.dart';
import '../../constants/colors.dart';
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: primaryColor,
        foregroundColor: textColor,
      ),
      body: Center(
        child: Text('صفحة الإعدادات', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
