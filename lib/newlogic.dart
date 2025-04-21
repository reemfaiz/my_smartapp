import 'package:flutter/material.dart'; // استيراد مكتبة تصميم الواجهات
import 'package:my_smartapp/surenew.dart'; // استيراد صفحة التحقق بعد التسجيل

class Newlogic extends StatefulWidget {
  const Newlogic({super.key});

  @override
  State<Newlogic> createState() => _NewlogicState(); // ربط الكلاس بالـ state
}

class _NewlogicState extends State<Newlogic> {
  final _formKey =
      GlobalKey<FormState>(); // مفتاح لربط النموذج مع التحقق من الحقول

  bool isChecked = false; // لحفظ حالة زر "تذكرني"

  // Controllers للتحكم في النص المدخل داخل الحقول
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  // دالة تعيد تصميم الحقل بشكل موحد، مع خيار لإضافة أيقونة أو عنصر على اليمين
  InputDecoration customDecoration(String label, {Widget? suffix}) {
    return InputDecoration(
      labelText: label, // عنوان الحقل
      labelStyle: TextStyle(
        fontFamily: "Cairo", // نوع الخط
        color: Color(0xFFC40CC4).withOpacity(0.6), // لون عنوان الحقل
      ),
      suffixIcon: suffix, // عنصر مضاف في نهاية الحقل (مثل زر أو checkbox)
      enabledBorder: OutlineInputBorder(
        // شكل الحقل عند الحالة العادية
        borderSide: BorderSide(color: Color(0xFFC40CC4), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        // شكل الحقل عند التركيز
        borderSide: BorderSide(color: Color(0xFFC40CC4), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        // شكل الحقل عند وجود خطأ
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        // شكل الحقل عند الخطأ والتركيز
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // بداية التطبيق المصغر داخل الصفحة
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true), // تفعيل تصميم Material 3
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          // ترتيب العناصر فوق بعض
          children: [
            // زر الإغلاق للرجوع
            Positioned(
              top: 50,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // يرجع للصفحة السابقة
                },
                child: Image.asset(
                  'assets/icon_close (1).png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            // خلفية علوية باهتة
            Positioned.fill(
              top: -500,
              right: -100,
              child: Opacity(
                opacity: 0.1,
                child: Image.asset("assets/image.png"),
              ),
            ),
            // خلفية سفلية باهتة
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
            // عرض الشعار في منتصف الصفحة
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
            // الحاوية الرئيسية البيضاء لحقول الإدخال
            Center(
              child: SingleChildScrollView(
                // لدعم التمرير في الأجهزة الصغيرة
                padding: const EdgeInsets.only(top: 180),
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.85, // 85٪ من عرض الشاشة
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: const [
                      // ظل الحاوية
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Form(
                    // لربط الحقول بالتحقق منها
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),

                        // حقل اسم المستخدم
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

                        // حقل كلمة المرور مع زر "تذكرني"
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
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Cairo",
                                    color: Color(0xFFC40CC4),
                                  ),
                                ),
                                Checkbox(
                                  // مربع "تذكرني"
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                  activeColor: Color(0xFFC40CC4),
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

                        // تأكيد كلمة المرور
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

                        // البريد الإلكتروني
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

                        // رقم الهاتف
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

                        // زر "تسجيل اشتراك جديد"
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              // تدرج لوني للزر
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
                                // إذا تم التحقق من الحقول → انتقل لصفحة Surenew
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Surenew()),
                                );
                              }
                            },
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
