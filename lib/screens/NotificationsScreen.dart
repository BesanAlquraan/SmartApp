import 'package:flutter/material.dart';
import '../main.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: primaryColor,
        foregroundColor: textColor,
      ),
      body: Center(
        child: Text('صفحة الإشعارات', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
