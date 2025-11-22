import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'LoginPage.dart'; // تأكدي من المسار الصحيح
import 'privacy_policy_page.dart';
import 'terms_of_service_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoginHover = false;

  void _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    _showPrivacyDialog();
  }

 void _showPrivacyDialog() {
  bool isChecked = false;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: const Text("Privacy Agreement"),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) => setState(() => isChecked = value!),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black87, fontSize: 14),
                  children: [
                    const TextSpan(text: "I agree to the Meezanuk "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PrivacyPolicyPage(),
                            ),
                          );
                        },
                    ),
                    const TextSpan(text: " and "),
                    TextSpan(
                      text: "Terms of Service",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const TermsOfServicePage(),
                            ),
                          );
                        },
                    ),
                    const TextSpan(text: "."),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: isChecked
                ? () {
                    Navigator.of(context).pop();
                    _showReasonDialog(); // تابع الدالة التالية بعد الضغط
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              disabledBackgroundColor: Colors.grey,
            ),
            child: const Text("Continue"),
          ),
        ],
      ),
    ),
  );
}

  void _showReasonDialog() {
  String? selectedReason;
  String? hoveredReason;
  final reasons = {
    "💸 Get out of debt": "Get out of debt",
    "🤝 Manage money with my partner": "Manage money with my partner",
    "🧾 Simplify my finances": "Simplify my finances",
    "💰 Make the most of my money": "Make the most of my money",
    "🌤️ Create more breathing room": "Create more breathing room",
    "🎯 Feel more in control": "Feel more in control",
    "✨ Other": "Other",
  };

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 450),
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 0),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: StatefulBuilder(
              builder: (context, setState) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "🌟 What brings you to Meezanuk today?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF001F54),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // ✅ خيارات المربعات الأنيقة
                 Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: reasons.keys.map((key) {
    final value = reasons[key]!;
    final isSelected = selectedReason == value;
    final isHovered = hoveredReason == value;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: MouseRegion(
        onEnter: (_) => setState(() => hoveredReason = value),
        onExit: (_) => setState(() => hoveredReason = null),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => setState(() => selectedReason = value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            width: 500, // حجم أصغر للمربع
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.grey[200]
                  : (isHovered ? Colors.grey[150] : Colors.grey[100]),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Colors.blueAccent : Colors.grey[300]!,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    key,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
                if (isSelected)
                  const Icon(
                    Icons.check_circle,
                    color: Colors.blueAccent,
                    size: 24,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }).toList(),
),


                  const SizedBox(height: 30),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 140,
                      height: 48,
                      decoration: BoxDecoration(
                        color: selectedReason == null
                            ? Colors.grey[300]
                            : const Color(0xFF007BFF),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          if (selectedReason != null)
                            const BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: selectedReason == null
                            ? null
                            : () {
                                Navigator.of(context).pop();
                               _showPlanDialog();

                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: selectedReason == null
                              ? Colors.black54
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: anim1,
          curve: Curves.easeOutCubic,
        )),
        child: child,
      );
    },
  );
}

/////////////////////////
void _showPlanDialog() {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 450),
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 0),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // صورة أعلى المربع
                SizedBox(
                  height: 120,
                  child: Image.network(
                    'https://via.placeholder.com/150', // ضع رابط صورتك هنا
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),

                // نصوص في المنتصف
                const Text(
                  "هيا نبني خطتنا!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF001F54),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "اختر الخيارات المناسبة واستمر في بناء خطة مالية شخصية تناسبك.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),

                // أزرار Continue و Back
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // زر Back
                    ElevatedButton(
                       onPressed: () {
    Navigator.of(context).pop(); // يغلق مربع الخطة
    _showReasonDialog(); // يرجع لمربع الأسباب
  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[400],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                      child: const Text(
                        "Back",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 15),

                    // زر Continue
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                       
                          _showFirstQuestionDialog()
                        ;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF007BFF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: anim1,
          curve: Curves.easeOutCubic,
        )),
        child: child,
      );
    },
  );
}
///////////////////
void _showFirstQuestionDialog() {
  List<String> selectedReasons = [];
  String? hoveredReason;

  final reasons = {
    "💸 Get out of debt": "Get out of debt",
    "🤝 Manage money with my partner": "Manage money with my partner",
    "🧾 Simplify my finances": "Simplify my finances",
    "💰 Make the most of my money": "Make the most of my money",
    "🌤️ Create more breathing room": "Create more breathing room",
    "🎯 Feel more in control": "Feel more in control",
    "✨ Other": "Other",
  };

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 450),
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 0),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: StatefulBuilder(
              builder: (context, setState) => Stack(
                children: [
                  // ✅ السؤال والخيارات في منتصف الشاشة
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "🌟 What brings you to Meezanuk today?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF001F54),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: reasons.keys.map((key) {
                            final value = reasons[key]!;
                            final isSelected = selectedReasons.contains(value);
                            final isHovered = hoveredReason == value;

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: MouseRegion(
                                onEnter: (_) =>
                                    setState(() => hoveredReason = value),
                                onExit: (_) =>
                                    setState(() => hoveredReason = null),
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        selectedReasons.remove(value);
                                      } else {
                                        selectedReasons.add(value);
                                      }
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 200),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 14),
                                    width: 500,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.grey[200]
                                          : (isHovered
                                              ? Colors.grey[150]
                                              : Colors.grey[100]),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: isSelected
                                            ? Colors.blueAccent
                                            : Colors.grey[300]!,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            key,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                        if (isSelected)
                                          const Icon(
                                            Icons.check_circle,
                                            color: Colors.blueAccent,
                                            size: 24,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  // ✅ الأزرار في أسفل يمين الشاشة
                  Positioned(
                    bottom: 10,
                    right: 20,
                    child: Row(
                      children: [
                        // 🔹 زر Back
                        SizedBox(
                          width: 110,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _showPlanDialog(); // العودة للـ dialog السابق
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              foregroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              "Back",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // 🔹 زر Continue
                        SizedBox(
                          width: 130,
                          height: 45,
                          child: ElevatedButton(
                              onPressed: () {
                        Navigator.of(context).pop();
                       
                          _showSeconedQuestionDialog();
                        
                      },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selectedReasons.isEmpty
                                  ? Colors.grey[300]
                                  : const Color(0xFF007BFF),
                              foregroundColor: selectedReasons.isEmpty
                                  ? Colors.black54
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: anim1,
          curve: Curves.easeOutCubic,
        )),
        child: child,
      );
    },
  );
}

//////////////
 void _showSeconedQuestionDialog() {
  String? selectedReason;
  String? hoveredReason;
  final reasons = {
    "💸 Get out of debt": "Get out of debt",
    "🤝 Manage money with my partner": "Manage money with my partner",
    "🧾 Simplify my finances": "Simplify my finances",
    "💰 Make the most of my money": "Make the most of my money",
    "🌤️ Create more breathing room": "Create more breathing room",
    "🎯 Feel more in control": "Feel more in control",
    "✨ Other": "Other",
  };

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 450),
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 0),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: StatefulBuilder(
              builder: (context, setState) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "🌟 What brings you to Meezanuk today?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF001F54),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // ✅ خيارات المربعات الأنيقة
                 Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: reasons.keys.map((key) {
    final value = reasons[key]!;
    final isSelected = selectedReason == value;
    final isHovered = hoveredReason == value;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: MouseRegion(
        onEnter: (_) => setState(() => hoveredReason = value),
        onExit: (_) => setState(() => hoveredReason = null),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => setState(() => selectedReason = value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            width: 500, // حجم أصغر للمربع
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.grey[200]
                  : (isHovered ? Colors.grey[150] : Colors.grey[100]),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Colors.blueAccent : Colors.grey[300]!,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    key,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
                if (isSelected)
                  const Icon(
                    Icons.check_circle,
                    color: Colors.blueAccent,
                    size: 24,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }).toList(),
),


                  const SizedBox(height: 30),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 140,
                      height: 48,
                      decoration: BoxDecoration(
                        color: selectedReason == null
                            ? Colors.grey[300]
                            : const Color(0xFF007BFF),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          if (selectedReason != null)
                            const BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: selectedReason == null
                            ? null
                            : () {
                                Navigator.of(context).pop();
                               _showPlanDialog();

                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: selectedReason == null
                              ? Colors.black54
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: anim1,
          curve: Curves.easeOutCubic,
        )),
        child: child,
      );
    },
  );
}
////////////////////

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, textAlign: TextAlign.center),
        content: Text(message, textAlign: TextAlign.center),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007BFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("OK", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
//////////////////

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    const double buttonHeight = 50;

    return Scaffold(
      body: Stack(
        children: [
          // خلفية متدرجة جميلة
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 22, 46, 71),
                  Color.fromARGB(255, 44, 61, 93),
                  Color(0xFF415A77),
                  Color.fromARGB(255, 137, 157, 184),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          const Positioned(
            top: 10,
            left: 30,
            child: Text(
              'Meezanuk',
              style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w800),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Container(
                width: isMobile ? double.infinity : 500,
                margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Create Account',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF001F54)),
                    ),
                    const SizedBox(height: 10),
                    const Text('Sign up to get started', style: TextStyle(color: Colors.black54, fontSize: 16)),
                    const SizedBox(height: 30),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: _buildTextField(
                                  controller: _firstNameController,
                                  label: 'First Name',
                                  hintText: 'Enter your first name',
                                  icon: Icons.person_outline,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) return '⚠️ Please enter your first name';
                                    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) return '⚠️ Name must contain only letters';
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildTextField(
                                  controller: _lastNameController,
                                  label: 'Last Name',
                                  hintText: 'Enter your last name',
                                  icon: Icons.person_outline,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) return '⚠️ Please enter your last name';
                                    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) return '⚠️ Name must contain only letters';
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildTextField(
                            controller: _emailController,
                            label: 'Email',
                            hintText: 'you@example.com',
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) return '⚠️ Please enter your email';
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) return '⚠️ Enter a valid email';
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          _buildTextField(
                            controller: _descriptionController,
                            label: 'Description',
                            hintText: 'Short description',
                            icon: Icons.description_outlined,
                          ),
                          const SizedBox(height: 20),
                          _buildTextField(
                            controller: _phoneController,
                            label: 'Phone Number',
                            hintText: 'Enter your number',
                            icon: Icons.phone_outlined,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) return '⚠️ Please enter your phone number';
                              if (!RegExp(r'^\d{7,15}$').hasMatch(value)) return '⚠️ Enter a valid phone number';
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          _buildPasswordField(
  controller: _passwordController,
  label: 'Password',
  obscure: _obscurePassword,
  onToggle: () => setState(() => _obscurePassword = !_obscurePassword),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return '⚠️ Please enter your password';
    }
    if (value.length < 8) {
      return '⚠️ Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return '⚠️ Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return '⚠️ Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return '⚠️ Password must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return '⚠️ Password must contain at least one special character';
    }
    return null;
  },
),

                          const SizedBox(height: 20),
                          _buildPasswordField(
                            controller: _confirmPasswordController,
                            label: 'Confirm Password',
                            obscure: _obscureConfirmPassword,
                            onToggle: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                            validator: (value) {
                              if (value == null || value.isEmpty) return '⚠️ Please confirm your password';
                              if (value != _passwordController.text) return '⚠️ Passwords do not match';
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            height: buttonHeight,
                            child: _isLoading
                                ? const Center(child: CircularProgressIndicator())
                                : ElevatedButton(
                                    onPressed: _signUp,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF007BFF),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                    child: const Text('Sign Up', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (_) => setState(() => _isLoginHover = true),
                                onExit: (_) => setState(() => _isLoginHover = false),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: _isLoginHover ? const Color.fromARGB(255, 117, 126, 139) : Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool obscure,
    required VoidCallback onToggle,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) return '⚠️ Please enter your password';
            if (value.length < 6) return '⚠️ Password must be at least 6 characters';
            return null;
          },
      decoration: InputDecoration(
        labelText: label,
        hintText: '********',
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
          onPressed: onToggle,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _descriptionController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
