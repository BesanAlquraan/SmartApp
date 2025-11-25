/*import 'package:flutter/material.dart';
import 'screens/LoginPage.dart';
import 'screens/TransactionsScreen.dart';
import 'screens/BudgetScreen.dart';
import 'screens/GoalsScreen.dart';
import 'screens/ReportsScreen.dart';
import 'screens/AdvisorScreen.dart';
import 'screens/ProfileScreen.dart';
import 'screens/SettingsScreen.dart';
import 'screens/NotificationsScreen.dart';

const Color primaryColor = Color.fromARGB(255, 176, 191, 211);
const Color textColor = Color.fromARGB(255, 22, 46, 71);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meezanuk',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}
class TestimonialWidget extends StatefulWidget {
  const TestimonialWidget({super.key});

  @override
  State<TestimonialWidget> createState() => _TestimonialWidgetState();
}



class _TestimonialWidgetState extends State<TestimonialWidget> {
  String currentText =
      "Very well done, polished, and makes tasks a bit more fun.";

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
        color: Color.fromARGB(255, 22, 46, 71),
        borderRadius: BorderRadius.circular(20), // حواف دائرية
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // النص أعلى المستطيل
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

          // النص المرتبط بالكلمة المختارة
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

          // الكلمات في مستطيلات صغيرة أسفل المستطيل الكبير
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
                  onTap: () {
                    setState(() {
                      currentText = quotes[word]!;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: isHovered
                          ? Colors.white
                          : Colors.white30, // لون المستطيل
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      word,
                      style: TextStyle(
                        color: isHovered ? Color.fromARGB(255, 22, 46, 71) : Color.fromARGB(255, 22, 46, 71) ,
                        fontWeight: isHovered
                            ? FontWeight.bold
                            : FontWeight.normal,
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
class _HomePageState extends State<HomePage> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isMobile = screenSize.width < 600;

    return Scaffold(
    appBar: AppBar(
  backgroundColor: primaryColor,
  title: Row(
    children: [
      // اسم التطبيق
      Text(
        'Meezanuk',
        style: TextStyle(
          color: textColor,
          fontSize: isMobile ? 24 : 30,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.5,
        ),
      ),
      if (!isMobile) SizedBox(width: 350), // مسافة بين الاسم والقائمة
      if (!isMobile)
        Row(
          children: [
            _navItem('Home', () {
  // نرجع للصفحة الرئيسية
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
    (route) => false, // يحذف كل الصفحات السابقة من الستاك
  );
}),

           _navItem('Transactions', () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TransactionsScreen()),
  );
}),
  _navItem('Budget', () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BudgetScreen()),
      );
    }),
    _navItem('Goals', () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GoalsScreen()),
      );
    }),
    _navItem('Reports', () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReportsScreen()),
      );
    }),
    _navItem('Advisor', () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdvisorScreen()),
      );
    }),
          ],
        ),
    ],
  ),
  // إذا الشاشة صغيرة، نظهر أيقونة Drawer
 actions: [
  PopupMenuButton<String>(
    icon: Icon(Icons.person, color: textColor),
    onSelected: (value) {
      switch (value) {
        case 'Login':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
          break;
        case 'Profile':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
          break;
        case 'Settings':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          );
          break;
        case 'Notifications':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationsScreen()),
          );
          break;
        case 'Logout':
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false,
          );
          break;
      }
    },
    itemBuilder: (context) => [
      _popupMenuItem('Login'),       // إضافة تسجيل الدخول
      _popupMenuItem('Profile'),
      _popupMenuItem('Settings'),
      _popupMenuItem('Notifications'),
      _popupMenuItem('Logout'),
    ],
  ),
],
),
endDrawer: isMobile
    ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: primaryColor),
              child: Text(
                'Meezanuk',
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _drawerItem('Home', () => print('Go to Home')),
            _drawerItem('Transactions', () => print('Go to Transactions')),
            _drawerItem('Budget', () => print('Go to Budget')),
            _drawerItem('Goals', () => print('Go to Goals')),
            _drawerItem('Reports', () => print('Go to Reports')),
            _drawerItem('Advisor', () => print('Go to Advisor')),
          ],
        ),
      )
    : null,
  body: Scrollbar(
  thumbVisibility: true, // يظهر دائمًا
  thickness: 8,          // عرض الشريط
  radius: Radius.circular(8),
  child: SingleChildScrollView(
    child: Container(
      width: double.infinity,
      color: primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : screenSize.width * 0.05,
        vertical: isMobile ? 16 : 50,
      ),
      child: isMobile
          ? _buildMobileLayout(screenSize)
          : _buildDesktopLayoutWithTestimonials(screenSize),
    ),
  ),
),

    );
  }
// لعرض عناصر AppBar على Desktop
Widget _navItem(String title, VoidCallback onTap) {
  bool _isHover = false; // متغير hover لكل عنصر

  return StatefulBuilder(
    builder: (context, setState) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHover = true),
        onExit: (_) => setState(() => _isHover = false),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _isHover ? Colors.white.withOpacity(0.2) : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: const Color.fromARGB(255, 9, 32, 56),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    },
  );
}

PopupMenuItem<String> _popupMenuItem(String title) {
  return PopupMenuItem<String>(
    value: title,
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

// لعرض عناصر Drawer على Mobile
Widget _drawerItem(String title, VoidCallback onTap) {
  return ListTile(
    title: Text(title, style: TextStyle(color: textColor)),
    onTap: () {
      Navigator.of(context).pop(); // إغلاق Drawer
      onTap();
    },
  );
}

  // Desktop Layout مع نصوص أعلى والصورة مع النص فوقها
Widget _buildDesktopLayoutWithTestimonials(Size screenSize) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // النصوص على اليسار مع زر Get Started
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(top: 80, left: 50, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Understand where \nyour money goes',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'With Meezanuk, managing your finances \nhas never been easier',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.017,
                      color: Color(0xFF415A77),
                    ),
                  ),
                  SizedBox(height: 30),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4F6B88),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // الصورة مع النص فوقها
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      'assets/images/bar_chart_1.png',
                      width: screenSize.width * 0.5,
                      height: screenSize.height * 0.7,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'THIS MONTH',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4F6B88),
                            ),
                          ),
                          Text(
                            '\$7,690.76',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF4F6B88),
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 60),
      // 🔥 TestimonialWidget أسفل الصفحة
      Center(
        child: Container(
          width: double.infinity, // ياخد كامل العرض
          padding: EdgeInsets.symmetric(vertical: 50),
          child: TestimonialWidget(),
        ),
      ),
    ],
  );
}

  // Mobile Layout مع الصورة دائمًا فوق النصوص والنص فوق الصورة
 

Widget _buildMobileLayout(Size screenSize) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Center(
          child: Stack(
            alignment: Alignment.topCenter, // النص أعلى الصورة
            children: [
              Image.asset(
                'assets/images/bar_chart_1.png',
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.3,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5), // مسافة من أعلى الصورة
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'THIS MONTH',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F6B88),
                      ),
                    ),
                    Text(
                      '\$7,690.76',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4F6B88),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20),

        // النصوص تحت الصورة
        Text(
          'Understand where your money goes',
          style: TextStyle(
            fontSize: screenSize.width * 0.07,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'With Meezanuk, managing your finances has never been easier',
          style: TextStyle(
            fontSize: screenSize.width * 0.04,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 20),

        // زر Get Started
       MouseRegion(
  cursor: SystemMouseCursors.click,
  onEnter: (_) => setState(() => _isHover = true),
  onExit: (_) => setState(() => _isHover = false),
  child: Padding(
    padding: const EdgeInsets.only(top: 50, left: 100), // مسافة من أعلى وزاوية يمين
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _isHover ? Color(0xFF2E4960) : Color(0xFF415A77),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      
    ),
  ),
),
  SizedBox(height: 30),
  SizedBox(height: 40),
Center(
  child: TestimonialWidget(), // 🔥 هنا
),
SizedBox(height: 40), // مسافة إضافية أسفل الزر
      ],
    ),

  );
}
}*/


import 'package:flutter/material.dart';
import 'screens/TransactionsScreen.dart';
import 'screens/budgetscreen.dart';
import 'screens/goalsscreen.dart';
import 'screens/reportsscreen.dart';
import 'screens/advisorscreen.dart';
import 'screens/LoginPage.dart';
import 'screens/NotificationsScreen.dart';
import 'screens/SettingsScreen.dart';
import 'screens/ProfileScreen.dart';
// ================== COLORS ==================
import '../../constants/colors.dart';

// ================== MAIN ==================
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meezanuk',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

// ================== HOME PAGE ==================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isMobile = screenSize.width < 600;

    return Scaffold(
     appBar: AppBar(
  backgroundColor: primaryColor,
  title: Row(
    children: [
      // اسم التطبيق على اليسار
      Text(
        'Meezanuk',
        style: TextStyle(
          color: textColor,
          fontSize: isMobile ? 24 : 30,
          fontWeight: FontWeight.w800,
        ),
      ),
      const Spacer(), // مسافة بين الاسم والأزرار
      if (!isMobile)
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // ← هنا
          children: [
           NavItem(
  title: 'Transactions',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TransactionsScreen()),
    );
  },
),
NavItem(
  title: 'Budget',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BudgetScreen()),
    );
  },
),
NavItem(
  title: 'Goals',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GoalsScreen()),
    );
  },
),
NavItem(
  title: 'Reports',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReportsScreen()),
    );
  },
),
NavItem(
  title: 'Advisor',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdvisorPage()),
    );
  },
),

          ],
        ),
      const Spacer(), // مسافة بين الأزرار وأيقونة المستخدم
      // أيقونة المستخدم على اليمين
     PopupMenuButton<String>(
  icon: Icon(Icons.person, color: textColor),
  onSelected: (value) {
    switch (value) {
      case 'Login':
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        break;
      case 'Profile':
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
        break;
      case 'Settings':
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
        break;
      case 'Notifications':
        Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen()));
        break;
      case 'Logout':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
        );
        break;
    }
  },
  itemBuilder: (BuildContext context) {
    return [
      PopupMenuItem<String>(
        value: 'Login',
        child: Text('Login'),
      ),
      PopupMenuItem<String>(
        value: 'Profile',
        child: Text('Profile'),
      ),
      PopupMenuItem<String>(
        value: 'Settings',
        child: Text('Settings'),
      ),
      PopupMenuItem<String>(
        value: 'Notifications',
        child: Text('Notifications'),
      ),
      PopupMenuItem<String>(
        value: 'Logout',
        child: Text('Logout'),
      ),
    ];
  },
)
],
  ),
),

      endDrawer: isMobile
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: primaryColor),
                    child: Text(
                      'Meezanuk',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DrawerItem(title: 'Home', onTap: () {}),
                  DrawerItem(title: 'Transactions', onTap: () {}),
                  DrawerItem(title: 'Budget', onTap: () {}),
                  DrawerItem(title: 'Goals', onTap: () {}),
                  DrawerItem(title: 'Reports', onTap: () {}),
                  DrawerItem(title: 'Advisor', onTap: () {}),
                ],
              ),
            )
          : null,
      body: Scrollbar(
        thumbVisibility: true,
        thickness: 8,
        radius: const Radius.circular(8),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: primaryColor,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : screenSize.width * 0.05,
              vertical: isMobile ? 16 : 50,
            ),
            child: isMobile
                ? buildMobileLayout(screenSize)
                : buildDesktopLayout(screenSize),
          ),
        ),
      ),
    );
  }
}

// ================== NAV ITEM WIDGET ==================
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _isHover ? Colors.white.withOpacity(0.2) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Color.fromARGB(255, 9, 32, 56),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

// ================== DRAWER ITEM WIDGET ==================
class DrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const DrawerItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: textColor)),
      onTap: onTap,
    );
  }
}

// ================== TESTIMONIAL WIDGET ==================
class TestimonialWidget extends StatefulWidget {
  const TestimonialWidget({super.key});

  @override
  State<TestimonialWidget> createState() => _TestimonialWidgetState();
}

class _TestimonialWidgetState extends State<TestimonialWidget> {
  String currentText =
      "Very well done, polished, and makes tasks a bit more fun.";

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
                  onTap: () {
                    setState(() {
                      currentText = quotes[word]!;
                    });
                  },
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
                        color: isHovered ? const Color.fromARGB(255, 22, 46, 71) : const Color.fromARGB(255, 22, 46, 71),
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

// ================== LAYOUTS ==================
Widget buildDesktopLayout(Size screenSize) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 80, left: 50, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Understand where \nyour money goes',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'With Meezanuk, managing your finances \nhas never been easier',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.017,
                      color: const Color(0xFF415A77),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F6B88),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      'assets/images/bar_chart_1.png',
                      width: screenSize.width * 0.5,
                      height: screenSize.height * 0.7,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'THIS MONTH',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4F6B88),
                            ),
                          ),
                          Text(
                            '\$7,690.76',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF4F6B88),
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 60),
      const Center(child: TestimonialWidget()),
    ],
  );
}

Widget buildMobileLayout(Size screenSize) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      TestimonialWidget(),
    ],
  );
}






