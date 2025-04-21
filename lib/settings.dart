import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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

          // العنوان والسهم
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
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
                    'الإعدادات',
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

          // البوكس الأبيض في المنتصف
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.purple.withOpacity(0.7)),
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
                    _buildBoxButton(context, "الحساب الشخصي", "/Profile"),
                    const SizedBox(height: 15),
                    _buildBoxButton(context, "تغيير اللغة", "/Langu"),
                    const SizedBox(height: 15),
                    _buildBoxButton(context, "تواصل معنا", "/contact"),
                    const SizedBox(height: 15),
                    _buildBoxButton(context, "تقييمك يطوّرنا", "/rate"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoxButton(BuildContext context, String title, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF381DFF), width: 1.2),
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
              color: Color(0xFF381DFF),
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
            colors: [
              Color(0xFFCEAAEE),
              Colors.white,
            ],
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
