import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:my_smartapp/surenew.dart';
import 'package:my_smartapp/services/auth_service.dart'; // استيراد خدمة المصادقة

class Newlogic extends StatefulWidget {
  const Newlogic({super.key});

  @override
  State<Newlogic> createState() => _NewlogicState();
}

class _NewlogicState extends State<Newlogic> {
  final _formKey = GlobalKey<FormState>();
  final SmartAuthService _authService =
      SmartAuthService(); // إنشاء مثيل لخدمة المصادقة
  bool isChecked = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String _errorMessage = ''; // متغير لعرض رسائل الخطأ

  // دالة التسجيل
  Future<void> _handleRegister() async {
    setState(() {
      _errorMessage = ''; // مسح أي خطأ سابق
    });

    if (_formKey.currentState!.validate()) {
      // تحقق من صحة الحقول
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();
      final confirm = confirmController.text.trim();
      final email = emailController.text.trim();
      final phone = phoneController.text.trim();

      try {
        final response = await _authService.sendOTP(email);

        if (response.statusCode == 200) {
          // التسجيل ناجح
          print("sent otp successful");
          // هنا يمكنك الانتقال إلى صفحة تأكيد الحساب أو أي صفحة أخرى
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Surenew(
                userData: {
                  "username": username,
                  "email": email,
                  "phoneNumber": phone,
                  "password": password,
                  "confirmPassword": confirm,
                },
              ),
            ),
          );
        } else {
          // التسجيل فشل
          Map<String, dynamic> errorResponse = json.decode(response.body);
          String errorMessage = errorResponse['message'] ??
              'Failed to register. Please check your information.'; // رسالة خطأ افتراضية
          setState(() {
            _errorMessage = errorMessage;
          });
          print('Registration failed: $errorMessage');
        }
      } catch (error) {
        // خطأ في الاتصال أو غيره
        print('Error during registration: $error');
        setState(() {
          _errorMessage =
              'An unexpected error occurred. Please try again later.';
        });
      }
    }
  }

  InputDecoration customDecoration(String label, {Widget? suffix}) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        fontFamily: "Cairo",
        color: Color(0xFFC40CC4).withOpacity(0.6),
      ),
      suffixIcon: suffix,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFC40CC4), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFC40CC4), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void dispose() {
    // تخلص من الـ Controllers
    usernameController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 50,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/icon_close (1).png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            Positioned.fill(
              top: -500,
              right: -100,
              child: Opacity(
                opacity: 0.1,
                child: Image.asset("assets/image.png"),
              ),
            ),
            Positioned(
              bottom: 6,
              left: 0,
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
                child: Image.asset(
                  "assets/logo_text.png",
                  height: 100,
                ),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: usernameController,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          decoration: customDecoration('اسم المستخدم:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء إدخال اسم المستخدم';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: passwordController,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          obscureText: true,
                          decoration: customDecoration(
                            'كلمة المرور:',
                            suffix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'تذكرني',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Cairo",
                                    color: Color(0xFFC40CC4),
                                  ),
                                ),
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                  activeColor: const Color(0xFFC40CC4),
                                  visualDensity: VisualDensity.compact,
                                ),
                              ],
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء إدخال كلمة المرور';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: confirmController,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          obscureText: true,
                          decoration: customDecoration('تأكيد كلمة المرور:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء تأكيد كلمة المرور';
                            }
                            if (value != passwordController.text) {
                              return 'كلمتا المرور غير متطابقتين';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          decoration: customDecoration('البريد الإلكتروني:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء إدخال البريد الإلكتروني';
                            }
                            if (!value.contains('@')) {
                              return 'صيغة البريد غير صحيحة';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          decoration: customDecoration('رقم الهاتف:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء إدخال رقم الهاتف';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
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
                            onPressed: _handleRegister, // استدعاء دالة التسجيل
                            child: const Text(
                              "تسجيل اشتراك جديد",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cairo",
                              ),
                            ),
                          ),
                        ),
                        // عرض رسالة الخطأ هنا
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
            ),
          ],
        ),
      ),
    );
  }
}
