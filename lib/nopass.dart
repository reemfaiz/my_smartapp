import 'package:flutter/material.dart';
import 'package:my_smartapp/surepass.dart';

class Nopass extends StatefulWidget {
  const Nopass({super.key});

  @override
  State<Nopass> createState() => _NopassState();
}

class _NopassState extends State<Nopass> {
  final _formKey = GlobalKey<FormState>();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: newPassController,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'كلمة المرور الجديدة',
                          labelStyle: TextStyle(
                            fontFamily: "Cairo",
                            color: Color(0xFFC40CC4).withOpacity(0.6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFC40CC4), width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال كلمة المرور الجديدة';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: confirmPassController,
                        textAlign: TextAlign.right,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'تكرار كلمة المرور:',
                          labelStyle: TextStyle(
                            fontFamily: "Cairo",
                            color: Color(0xFFC40CC4).withOpacity(0.6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFC40CC4), width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إعادة كتابة كلمة المرور';
                          }
                          if (value != newPassController.text) {
                            return 'كلمتا المرور غير متطابقتين';
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Surepass()),
                              );
                            }
                          },
                          child: const Text(
                            "تغيير كلمة المرور",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cairo"),
                          ),
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
    );
  }
}
