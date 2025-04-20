import 'package:flutter/material.dart';

class Biganaly extends StatelessWidget {
  const Biganaly({super.key});

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

          // محتوى الصفحة
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
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
                    'التحليلات',
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

          // شبكة الأزرار
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                children: [
                  _buildImageCard(context, 'assets/Frame-1984079920.png', '/Healthanaly'),
                  _buildImageCard(context, 'assets/Frame-1984079921.png', '/AnalysisScreen'),
                  _buildImageCard(context, 'assets/Frame-1984079923 (1).png', '/Injuries'),
                  _buildImageCard(context, 'assets/Frame-1984079922.png', '/Matchstats'),
                ],
              ),
            ),
          ),

          // صورة الدوائر في الأسفل
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
        ],
      ),
    );
  }

  Widget _buildImageCard(BuildContext context, String imagePath, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
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
        margin: const EdgeInsets.all(0),
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