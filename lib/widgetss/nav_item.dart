import 'package:flutter/material.dart';
import '../constants/colors.dart';

class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const NavItem({required this.title, required this.onTap, super.key});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    final double fontSize =
        MediaQuery.of(context).size.width < 600 ? 14 : 18;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHover = true),
      onExit: (_) => setState(() => _isHover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _isHover ? primaryColor.withOpacity(0.2) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: _isHover ? primaryColor : textColor,
              fontSize: fontSize,
              fontWeight: _isHover ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
