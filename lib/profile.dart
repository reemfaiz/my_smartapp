import 'package:flutter/material.dart';
import 'package:my_smartapp/delet.dart';
import 'package:my_smartapp/done.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خلفية التدرج
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(0, 197, 16, 197),
                  Color.fromARGB(128, 56, 29, 255),
                ],
                stops: [0.0, 0.97],
              ),
            ),
          ),

          // الترويسة
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/arrow.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'الحساب الشخصي',
                    style: TextStyle(
                      color: Color(0xFFC40CC4),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ],
              ),
            ),
          ),

          // صورة الدوائر
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/Group-1984079898.png',
              fit: BoxFit.contain,
            ),
          ),

          // البار السفلي
          const Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: CustomBottomBar(),
          ),

          // مربع النموذج ثابت
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: const Color.fromARGB(255, 165, 83, 180)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildEditableField("اسم المستخدم"),
                    const SizedBox(height: 12),
                    _buildEditableField("كلمة المرور"),
                    const SizedBox(height: 12),
                    _buildEditableField("رقم الهاتف"),
                    const SizedBox(height: 12),
                    _buildEditableField("البريد الإلكتروني"),
                    const SizedBox(height: 12),
                    _buildEditableField("اسم الأكاديمية"),
                    const SizedBox(height: 16),
                    const Text(
                      "الجنس",
                      style: TextStyle(
                        color: Color(0xFFC510C5),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const GenderSelector(),
                    const SizedBox(height: 24),

                    // زر حذف الحساب
                    Center(
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DELEDT()),
                          );
                        },
                        icon:
                            const Icon(Icons.delete_outline, color: Colors.red),
                        label: const Text(
                          "حذف الحساب",
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

  Widget _buildEditableField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFC510C5),
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 40, // ← تصغير حجم المربع
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFFCEAAEE), width: 1),
          ),
          child: Stack(
            children: [
              const TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  border: InputBorder.none,
                ),
              ),
              const Positioned(
                left: 16,
                bottom: 4,
                child: Text(
                  "تعديل",
                  style: TextStyle(
                    color: Color(0xFFC510C5),
                    fontFamily: 'Cairo',
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String selectedGender = "ذكر";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildGenderButton("ذكر"),
        const SizedBox(width: 10),
        _buildGenderButton("أنثى"),
      ],
    );
  }

  Widget _buildGenderButton(String gender) {
    bool isSelected = selectedGender == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGender = gender;
          });
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFFC40CC4), Color(0xFF381DFF)],
                  )
                : null,
            color: isSelected ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFFC510C5),
              width: 1.3,
            ),
          ),
          child: Center(
            child: Text(
              gender,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFFC510C5),
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          BottomNavItem(title: 'الإعدادات', route: '/Settings'),
          SizedBox(height: 2),
          BottomNavItem(title: 'AI Chat', route: '/chat'),
          SizedBox(height: 2),
          BottomNavItem(title: 'التحليلات', route: '/Biganaly'),
          SizedBox(height: 2),
          BottomNavItem(title: 'الرئيسية', route: '/home'),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String title;
  final String route;

  const BottomNavItem({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: 95,
        height: 95,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFFCEAAEE), Colors.white],
            stops: [0.0, 0.79],
          ),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xFFC510C5).withOpacity(0.4),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF381DFF),
              fontFamily: 'Cairo',
            ),
          ),
        ),
      ),
    );
  }
}
