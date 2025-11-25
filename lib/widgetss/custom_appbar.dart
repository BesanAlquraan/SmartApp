import 'package:flutter/material.dart';
import '../screens/TransactionsScreen.dart';
import '../screens/budgetscreen.dart';
import '../screens/goalsscreen.dart';
import '../screens/reportsscreen.dart';
import '../screens/advisorscreen.dart';
import '../screens/ProfileScreen.dart';
import '../screens/LoginPage.dart';
import '../screens/SettingsScreen.dart';
import '../screens/NotificationsScreen.dart';
import '../../constants/colors.dart';
// ================== COLORS ==================


// ================== NAV ITEM ==================
class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const NavItem({super.key, required this.title, required this.onTap});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
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
            color: _isHover ? Colors.white.withOpacity(0.2) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: _isHover ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

// ================== CUSTOM APP BAR ==================
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 900;

        // قائمة الأزرار ديناميكية
        final List<Map<String, dynamic>> navItems = [
          {"title": "Transactions", "screen": TransactionsScreen()},
          {"title": "Budget", "screen": BudgetScreen()},
          {"title": "Goals", "screen": GoalsScreen()},
          {"title": "Reports", "screen": ReportsScreen()},
          {"title": "Advisor", "screen": const AdvisorPage()},
        ];

        // قائمة الـ Popup Menu
        final Map<String, Widget> menuRoutes = {
          'Login': LoginScreen(),
          'Profile': ProfileScreen(),
          'Settings': SettingsScreen(),
          'Notifications': NotificationsScreen(),
          'Logout': LoginScreen(),
        };

        return AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
 automaticallyImplyLeading: false,
          // زر Menu للموبايل
          leading: !isDesktop
              ? Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: textColor),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                )
              : null,

          // عنوان + NavItems
          title: Row(
            children: [
              Text(
                'Meezanuk',
                style: TextStyle(
                  color: textColor,
                  fontSize: isDesktop ? 30 : 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isDesktop)
                Expanded(
                  child: Center(
                    child: Wrap(
                      spacing: 12,
                      alignment: WrapAlignment.center,
                      children: navItems.map((item) {
                        return NavItem(
                          title: item['title'],
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => item['screen']),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
            ],
          ),

          // أيقونة المستخدم + قائمة
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.person, color: textColor),
              onSelected: (value) {
                if (value == 'Logout') {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => menuRoutes[value]!),
                      (route) => false);
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => menuRoutes[value]!));
                }
              },
              itemBuilder: (BuildContext context) {
                return menuRoutes.keys.map((key) {
                  return PopupMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                }).toList();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
