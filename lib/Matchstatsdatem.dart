import 'package:flutter/material.dart';
import 'package:my_smartapp/Injurievidio.dart';
import 'package:my_smartapp/Matchstavidio.dart';
import 'package:my_smartapp/Video.dart';
import 'package:my_smartapp/healthyvideo.dart';

class Matchstatsdatem extends StatelessWidget {
  const Matchstatsdatem  ({super.key});

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
                  Color.fromARGB(0, 197, 16, 197), // C510C5 - شفاف جدًا (فوق)
                  Color.fromARGB(128, 56, 29, 255),
                ],
                stops: [0.0, 0.97],
              ),
            ),
          ),

          // محتوى الصفحة
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
                  const Text('تحميل تحليل احصائيات المباراة'
                  ,style: TextStyle(
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
            bottom: 30, // فوق صورة الدوائر
            left: 0,
            right: 0,
            child: CustomBottomBar(),
          ),
      
      
  //البوكس الأبيض مصغر وفي منتصف الشاشة
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  width:
                      MediaQuery.of(context).size.width * 0.85, // تصغير العرض
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
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10), // بدل اللوقو
                      Image.asset(
                        "assets/Isolation_Mod-e.png",
                        height: 80,
                      ), //صوره الحمايه

                      const SizedBox(height: 19),

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
                          onPressed: () {  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Matchstavidio()
                                    ),
                              );

                          },
                          child: const Text(
                            "تحميل الفيديو الرياضي",
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
















      
      
      
      
      
      
      
      
      
      
        ],
      ),
    );
  }
}



//  ويدجت الأزرار (بار داخلي)
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
          SizedBox(height: 2,),
          BottomNavItem(title: 'AI Chat', route: '/chat'),
          SizedBox(height: 2,),
          BottomNavItem(title:  'التحليلات', route: '/Biganaly'),
          SizedBox(height: 2,),
          BottomNavItem(title: 'الرئيسية', route: '/home'),
        ],
      ),
    );
  }
}

//  ويدجت زر مفرد بدون خلفية
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
        margin:
            const EdgeInsets.all(0), //  مسافة بين الأزرار
        decoration: BoxDecoration(
          //  التدرج اللوني
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFCEAAEE), // موف فاتح
    Colors.white,   // #C40CC4 - 100% opacity
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
