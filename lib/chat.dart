import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

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
                    'نتيجة التحليل',
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

          // مربع التحليل الكبير
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 24, right: 24, bottom: 180),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  border: Border.all(color: Color(0xFFC40CC4).withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // زر AI Chat تحت المربع
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 170.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 45,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF381DFF), Color(0xFF6A40F8), Color(0xFF1DFFE8)],
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
                  onPressed: () {},
                  child: const Text(
                    "AI Chat",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Cairo",
                    ),
                  ),
                ),
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

          //  الأزرار داخل الصفحة وليست شريط سفلي
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
