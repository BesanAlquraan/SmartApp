import 'package:flutter/material.dart';
import '../constants/colors.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const DrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    final double fontSize = isMobile ? 14 : 16;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
        leading: Icon(icon, color: textColor),
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
          onTap();
        },
      ),
    );
  }
}
