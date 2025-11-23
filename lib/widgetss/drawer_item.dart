import 'package:flutter/material.dart';
import '../constants/colors.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const DrawerItem({required this.title, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(color: textColor)),
      onTap: () {
        Navigator.of(context).pop();
        onTap();
      },
    );
  }
}
