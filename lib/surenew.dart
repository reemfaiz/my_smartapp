import 'package:flutter/material.dart';
import 'package:my_smartapp/done.dart';
import 'package:my_smartapp/services/auth_service.dart'; // Import your AuthService
import 'dart:convert';

class Surenew extends StatefulWidget {
  final Map<String, String> userData;

  const Surenew({super.key, required this.userData});

  @override
  _SurenewState createState() => _SurenewState();
}

class _SurenewState extends State<Surenew> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> codeControllers =
      List.generate(4, (index) => TextEditingController());
  String _errorMessage = '';
  final SmartAuthService _authService =
      SmartAuthService(); //Instance of AuthService

  bool isCodeComplete() {
    return codeControllers.every((controller) => controller.text.isNotEmpty);
  }

  @override
  void dispose() {
    for (var controller in codeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _handleVerification() async {
    setState(() {
      _errorMessage = '';
    });

    if (_formKey.currentState!.validate() && isCodeComplete()) {
      // Combine the verification code
      String verificationCode =
          codeControllers.map((c) => c.text).join(); //combine the code
      // Include the verification code and ALL user data.  Important.
      Map<String, String> verificationData = {
        'phone': widget.userData['phoneNumber'] ?? '',
        'code': verificationCode,
      };

      try {
        // 1. Call the validateOtp service first
        final otpResponse = await _authService.verify(
            widget.userData['email']!, verificationCode);

        if (otpResponse.statusCode == 200) {
          // OTP is valid, proceed with registration
          print('OTP verification successful!');
          // 2. Call the register service
          final registerResponse = await _authService.register(widget.userData);

          if (registerResponse.statusCode == 200) {
            // Registration successful, navigate to the DONE screen.
            print('Registration successful!');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DONE()),
            );
          } else {
            // Registration failed, show the error message.
            Map<String, dynamic> errorResponse =
                json.decode(registerResponse.body);
            String errorMessage =
                errorResponse['message'] ?? 'Failed to register user.';
            setState(() {
              _errorMessage = errorMessage;
            });
            print('Registration failed: $errorMessage');
          }
        } else {
          // OTP verification failed, show error
          Map<String, dynamic> errorResponse = json.decode(otpResponse.body);
          String errorMessage = errorResponse['message'] ?? 'الرمز خاطى';
          setState(() {
            _errorMessage = errorMessage;
          });
          print('OTP verification failed: $errorMessage');
        }
      } catch (error) {
        // Handle network or other errors.
        setState(() {
          _errorMessage = 'حصل خطأ';
        });
        print('Error: $error');
      }
    } else {
      setState(() {
        _errorMessage = 'الرجاء ادخال جميع الحقول';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Access user data from widget.userData
    final String username = widget.userData['username'] ??
        ''; // Provide default values in case of null.  VERY IMPORTANT.
    final String email = widget.userData['email'] ?? '';
    final String phoneNumber = widget.userData['phoneNumber'] ?? '';

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
                padding: const EdgeInsets.only(top: 100),
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
                        const Text(
                          "أدخل الرمز المكون من 4 أرقام",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFC40CC4),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "تم إرسال الرمز إلى الرقم $phoneNumber", // Use phoneNumber
                          style: const TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(4, (index) {
                            return SizedBox(
                              width: 55,
                              child: TextFormField(
                                controller: codeControllers[index],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                maxLength: 1, // Limit to 1 character
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Cairo",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF381DFF),
                                ),
                                decoration: InputDecoration(
                                  counterText:
                                      '', //remove the character counter,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFC40CC4)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value.length == 1 && index < 3) {
                                    // Move focus to the next input field
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 24),
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
                            onPressed:
                                _handleVerification, // Call the verification method.
                            child: const Text(
                              "تحقق",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cairo",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () {
                            // إعادة إرسال الرمز
                          },
                          child: const Text(
                            "إرسال الرمز مرة ثانية",
                            style: TextStyle(
                              fontFamily: "Cairo",
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        if (_errorMessage.isNotEmpty) //show error message.
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
