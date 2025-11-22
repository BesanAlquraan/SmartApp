import 'package:flutter/material.dart';
import '../main.dart'; // إذا كنت تحتاجي الوصول للـ colors أو غيرها

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: primaryColor,
        foregroundColor: textColor,
      ),
      body: Center(
        child: Text('صفحة الملف الشخصي', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
