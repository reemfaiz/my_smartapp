import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_smartapp/newlogic.dart';
import 'package:my_smartapp/nopass.dart';
import 'package:my_smartapp/services/auth_service.dart';
import 'package:my_smartapp/views/features/dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final SmartAuthService _authService = SmartAuthService();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  String _errorMessage = ''; // Added to store and display error messages.

  Future<void> _handleLogin() async {
    print("here");
    setState(() {
      _errorMessage = ''; // Clear any previous error message.
    });
    final email = usernameController.text.trim();
    final password = passwordController.text.trim();
    try {
      final response = await _authService.login({
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        print("success");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardView()),
        );
      } else {
        //handle different error codes
        Map<String, dynamic> errorResponse = json.decode(response.body);
        String errorMessage = errorResponse['message'] ??
            'Failed to login. Please check your credentials.'; //Provide a default
        setState(() {
          _errorMessage = errorMessage;
        });
        print("error");
      }
    } catch (error) {
      print('Error during login: $error');
      setState(() {
        _errorMessage = 'معلومات الدخول غير صحيحه';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(
              top: -500,
              left: -100,
              child: Opacity(
                opacity: 0.1,
                child: Image.asset("assets/image.png"),
              ),
            ),
            Positioned(
              bottom: 6,
              right: 0,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  "assets/image.png",
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 150,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset("assets/logo_text.png", height: 100),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 180),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextField(
                        controller: usernameController,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          labelText: 'اسم المستخدم:',
                          labelStyle: TextStyle(
                            fontFamily: "Cairo",
                            color: Color(0xFFC40CC4).withOpacity(0.6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFFC40CC4), width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: passwordController,
                        textAlign: TextAlign.right,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'كلمة المرور:',
                          labelStyle: TextStyle(
                            fontFamily: "Cairo",
                            color: Color(0xFFC40CC4).withOpacity(0.6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFFC40CC4), width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            activeColor: Color(0xFFC40CC4),
                          ),
                          const Text(
                            "تذكرني",
                            style: TextStyle(
                                color: Color(0xFFC40CC4), fontFamily: "Cairo"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Newlogic()),
                              );
                            },
                            child: const Text(
                              "اشترك جديد؟",
                              style: TextStyle(
                                  color: Color(0xFFC40CC4),
                                  decoration: TextDecoration.underline,
                                  fontFamily: "Cairo"),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Nopass()),
                              );
                            },
                            child: const Text(
                              "نسيت كلمة المرور؟",
                              style: TextStyle(
                                  color: Color(0xFFC40CC4),
                                  decoration: TextDecoration.underline,
                                  fontFamily: "Cairo"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFC40CC4),
                              Color(0xFF381DFF),
                              Color(0xFF1DFFE8),
                            ],
                            stops: [0.0, 0.69, 0.97],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            String user = usernameController.text.trim();
                            String pass = passwordController.text.trim();

                            if (user.isEmpty || pass.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('الرجاء إدخال جميع الحقول'),
                                ),
                              );
                            } else {
                              _handleLogin();
                            }
                          },
                          child: const Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cairo"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              color: Color(0xFFC40CC4),
                              thickness: 1,
                              endIndent: 8,
                            ),
                          ),
                          Text(
                            "أو",
                            style: TextStyle(
                                color: Color(0xFFC40CC4), fontFamily: "Cairo"),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color(0xFFC40CC4),
                              thickness: 1,
                              indent: 8,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildSocialIcon('assets/google (1).png', () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('تم تسجيل الدخولGoogle')),
                            );
                          }),
                          const SizedBox(width: 16),
                          buildSocialIcon('assets/apple.png', () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('تسجيل الدخولـ Apple')),
                            );
                          }),
                          const SizedBox(width: 16),
                          buildSocialIcon('assets/facebook.png', () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('تسجيل دخول ـ Facebook')),
                            );
                          }),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Display the error message here
                      if (_errorMessage.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            _errorMessage,
                            style: const TextStyle(
                              color: Colors.red,
                              fontFamily: "Cairo",
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSocialIcon(String assetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Color(0xFFC40CC4), width: 1.5),
        ),
        child: Image.asset(assetPath, width: 24, height: 24),
      ),
    );
  }
}
