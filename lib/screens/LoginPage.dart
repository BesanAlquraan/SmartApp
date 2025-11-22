import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ForgetPassword.dart';
import 'SignUpPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isLoading = false;
  bool _obscurePassword = true;

  // Hover states
  bool _isForgotHover = false;
  bool _isForgotPressed = false;
  bool _isSignUpHover = false;
  bool _isSignUpPressed = false;
  bool _isRememberHover = false;

  void _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);

    _showDialog('Success', 'Welcome!');
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return '⚠️ Please enter your email';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return '⚠️ Enter a valid email format (you@mail.com)';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return '⚠️ Please enter your password';
    if (value.length < 6) return '⚠️ Password must be at least 6 characters';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    const double buttonHeight = 50;
    const double iconSize = 24;
    const double textSize = 16;

    return Scaffold(
      body: Stack(
        children: [
          // 🌈 الخلفية المميزة
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

          // 🔵 دوائر بيضاء شفافة
          Positioned(top: -60, left: -40, child: _buildCircle(150, Colors.white.withOpacity(0.15))),
          Positioned(top: 200, right: -70, child: _buildCircle(200, Colors.white.withOpacity(0.1))),
          Positioned(bottom: 100, left: -60, child: _buildCircle(180, Colors.white.withOpacity(0.08))),
          Positioned(bottom: -50, right: -40, child: _buildCircle(130, Colors.white.withOpacity(0.12))),

          // 🩵 اسم Meezanuk أعلى الشاشة
          Positioned(
            top: 10,
            left: 30,
            child: Text(
              'Meezanuk',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 28 : 34,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),

          // 🧾 واجهة تسجيل الدخول
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: isMobile ? double.infinity : 400,
                margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5)),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Welcome Back 👋',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF001F54)),
                    ),
                    const SizedBox(height: 10),
                    const Text('Login to continue', style: TextStyle(color: Colors.black54, fontSize: 16)),
                    const SizedBox(height: 30),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Email
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              prefixIcon: const Icon(Icons.email_outlined),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: _validateEmail,
                          ),
                          const SizedBox(height: 20),

                          // Password
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                              ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            obscureText: _obscurePassword,
                            validator: _validatePassword,
                          ),
                          const SizedBox(height: 10),

                          // Keep me logged in + Forgot Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (v) => setState(() => _rememberMe = v!),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    onEnter: (_) => setState(() => _isRememberHover = true),
                                    onExit: (_) => setState(() => _isRememberHover = false),
                                    child: GestureDetector(
                                      onTap: () => setState(() => _rememberMe = !_rememberMe),
                                      child: Text(
                                        'Keep me logged in',
                                        style: TextStyle(
                                          color:Colors.black,
                                         
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              MouseRegion(
                                onEnter: (_) => setState(() => _isForgotHover = true),
                                onExit: (_) => setState(() => _isForgotHover = false),
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTapDown: (_) => setState(() => _isForgotPressed = true),
                                  onTapUp: (_) {
                                    setState(() => _isForgotPressed = false);
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgetPassword()));
                                  },
                                  onTapCancel: () => setState(() => _isForgotPressed = false),
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: _isForgotPressed
                                          ? Colors.grey
                                          : (_isForgotHover ? const Color.fromARGB(255, 117, 126, 139) : Colors.blue),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),

                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            height: buttonHeight,
                            child: _isLoading
                                ? const Center(child: CircularProgressIndicator())
                                : ElevatedButton(
                                    onPressed: _login,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF1976D2),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                    child: const Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  ),
                          ),
                          const SizedBox(height: 30),

                          // Divider
                          Row(
                            children: [
                              Expanded(child: Divider(color: Colors.grey[400])),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text('Or', style: TextStyle(color: Colors.grey)),
                              ),
                              Expanded(child: Divider(color: Colors.grey[400])),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Google Button
                          SizedBox(
                            width: double.infinity,
                            height: buttonHeight,
                            child: OutlinedButton(
                              onPressed: () => _showDialog('Google Sign In', 'Coming soon!'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black,
                                side: BorderSide(color: Colors.grey[300]!),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/google_icon.png', height: iconSize),
                                  const SizedBox(width: 10),
                                  const Text('Continue with Google', style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // Facebook Button
                          SizedBox(
                            width: double.infinity,
                            height: buttonHeight,
                            child: OutlinedButton(
                              onPressed: () => _showDialog('Facebook Sign In', 'Coming soon!'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black,
                                side: BorderSide(color: Colors.grey[300]!),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                                  SizedBox(width: 10),
                                  Text('Continue with Facebook', style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),

                          // Sign Up
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? "),
                              MouseRegion(
                                onEnter: (_) => setState(() => _isSignUpHover = true),
                                onExit: (_) => setState(() => _isSignUpHover = false),
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTapDown: (_) => setState(() => _isSignUpPressed = true),
                                  onTapUp: (_) {
                                    setState(() => _isSignUpPressed = false);
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpPage()));
                                  },
                                  onTapCancel: () => setState(() => _isSignUpPressed = false),
                                  child: Text(
                                    'Sign Up',
                                    
                                    style: TextStyle(
                                      color: _isSignUpPressed ? Colors.grey : (_isSignUpHover ? const Color.fromARGB(255, 117, 126, 139)  : Colors.blue),
                                      fontWeight: FontWeight.bold,
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

  Widget _buildCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
