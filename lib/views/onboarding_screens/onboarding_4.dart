import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:my_smartapp/Login.dart';
import 'package:my_smartapp/helpers/navigator.dart';
import 'package:my_smartapp/widgets/onboarding_progress.dart';

class OnBoardingFourView extends StatelessWidget {
  const OnBoardingFourView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/icons/icon_close.png'),
        backgroundColor:
            Colors.white, // Make AppBar transparent to show gradient
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(255, 224, 197, 247)],
          ),
        ),
        child: Column(
          // Changed Center to Column to align bottom row
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(right: 110.0),
              child: Image.asset(
                'assets/images/football-trainer-teaching-his-pupils.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 240.0),
              child: Container(
                color: const Color.fromRGBO(196, 12, 196, 0.8),
                height: 30,
                width: 20.0,
              ),
            ),
            SizedBox(
              width: 300.0,
              height: 40.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(196, 12, 196, 0.8),
                      Color.fromRGBO(56, 29, 255, 1.0),
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'كل التفاصيل في متناولك',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: const Text(
                'اطلع على إحصائيات كل مباراة\nبدقة: تمريرات، تسديدات،\nاستحواذ، وأكثر. قراراتك صارت\nمبنية على بيانات',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color.fromRGBO(56, 29, 255, 1.0),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 100),
            Padding(
              // Added Padding to control horizontal spacing of the Row
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Distribute space evenly
                children: [
                  GestureDetector(
                    onTap: () {
                      Future.microtask(() {
                        Future.microtask(() {
                          context.popView();
                        });
                      });
                    },
                    child: Transform.rotate(
                      angle: math.pi, // 180 degrees in radians
                      child: Image.asset('assets/icons/arrow.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Future.microtask(() {
                        context.removeUntil(view: Login());
                      });
                    },
                    child: Image.asset('assets/icons/arrow.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            PageIndicatorRow(currentPage: 3, indicatorCount: 4),
          ],
        ),
      ),
    );
  }
}
