import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

enum ResetOption { email, phone }

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _inputController = TextEditingController();
  bool _isLoading = false;
  ResetOption _resetOption = ResetOption.email;

  // Hover و Press variables
  bool _isHover = false;
  bool _isBackPressed = false;

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return _resetOption == ResetOption.email
          ? '⚠️ Please enter your email'
          : '⚠️ Please enter your phone number';
    }

    if (_resetOption == ResetOption.email) {
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(value)) return '⚠️ Enter a valid email format';
    } else {
      final phoneRegex = RegExp(r'^\d{10,15}$');
      if (!phoneRegex.hasMatch(value)) return '⚠️ Enter a valid phone number';
    }

    return null;
  }

  void _sendResetLink() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);

    _showDialog(
      'Reset Link Sent',
      _resetOption == ResetOption.email
          ? 'Please check your email for the reset link.'
          : 'A reset code has been sent to your phone.',
    );
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double buttonHeight = 50;
    const double textSize = 16;
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
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
          // Circles
          Positioned(top: -60, left: -40, child: _buildCircle(150, Colors.white.withOpacity(0.15))),
          Positioned(top: 200, right: -70, child: _buildCircle(200, Colors.white.withOpacity(0.1))),
          Positioned(bottom: 100, left: -60, child: _buildCircle(180, Colors.white.withOpacity(0.08))),
          Positioned(bottom: -50, right: -40, child: _buildCircle(130, Colors.white.withOpacity(0.12))),

          // Meezanuk text
          const Positioned(
            top:10,
            left: 30,
            child: Text(
              'Meezanuk',
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.w800,
              ),
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
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5)),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Reset Your Password',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF001F54)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Select how you want to receive your password reset link/code.',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      // Radio buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio<ResetOption>(
                            value: ResetOption.email,
                            groupValue: _resetOption,
                            onChanged: (value) => setState(() => _resetOption = value!),
                          ),
                          const Text('Email'),
                          const SizedBox(width: 30),
                          Radio<ResetOption>(
                            value: ResetOption.phone,
                            groupValue: _resetOption,
                            onChanged: (value) => setState(() => _resetOption = value!),
                          ),
                          const Text('Phone'),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Input Field
                      TextFormField(
                        controller: _inputController,
                        decoration: InputDecoration(
                          labelText: _resetOption == ResetOption.email ? 'Email' : 'Phone Number',
                          hintText: _resetOption == ResetOption.email ? 'Enter your email' : 'Enter your phone number',
                          prefixIcon: Icon(_resetOption == ResetOption.email ? Icons.email_outlined : Icons.phone),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.grey[50],
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType:
                            _resetOption == ResetOption.email ? TextInputType.emailAddress : TextInputType.phone,
                        validator: _validateInput,
                      ),
                      const SizedBox(height: 30),

                      // Send Reset Link Button
                      SizedBox(
                        width: double.infinity,
                        height: buttonHeight,
                        child: _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                                onPressed: _sendResetLink,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                child: Text(
                                  _resetOption == ResetOption.email ? 'Send Reset Link' : 'Send Reset Code',
                                  style: const TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
                                ),
                              ),
                      ),
                      const SizedBox(height: 20),

                      // Back to Login
                      MouseRegion(
                        onEnter: (_) => setState(() => _isHover = true),
                        onExit: (_) => setState(() => _isHover = false),
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTapDown: (_) => setState(() => _isBackPressed = true),
                          onTapUp: (_) {
                            setState(() => _isBackPressed = false);
                            Navigator.pop(context);
                          },
                          onTapCancel: () => setState(() => _isBackPressed = false),
                          child: Text(
                            'Back to Login',
                            style: TextStyle(
                              color: _isBackPressed || _isHover ? const Color.fromARGB(255, 117, 126, 139) : Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
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

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}
