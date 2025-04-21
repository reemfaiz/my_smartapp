import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:my_smartapp/helpers/navigator.dart';
import 'package:my_smartapp/views/onboarding_screens/onboarding_2.dart';
import 'package:my_smartapp/widgets/onboarding_progress.dart';

class OnBoardingOneView extends StatelessWidget {
  const OnBoardingOneView({super.key});

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
              padding: const EdgeInsets.only(left: 50.0),
              child: Image.asset(
                'assets/images/night-game-dynamic-soccer-player-action-field@2x.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 160.0),
              child: Container(
                color: const Color.fromRGBO(196, 12, 196, 0.8),
                height: 30,
                width: 20.0,
              ),
            ),
            SizedBox(
              width: 212.0,
              height: 37.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(56, 29, 255, 1.0),
                      Color.fromRGBO(196, 12, 196, 0.8),
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'اكتشف قوتك',
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
              // Added Center to keep text in the middle
              child: const Text(
                'حلّل حالتك الصحية بدقة وراقب\nمؤشراتك الحيوية لتحسين لياقتك\nوجودة حياتك.',
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
                  Transform.rotate(
                    angle: math.pi, // 180 degrees in radians
                    child: SizedBox(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Future.microtask(() {
                        context.pushView(view: OnBoardingTwoView());
                      });
                    },
                    child: Image.asset('assets/icons/arrow.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            PageIndicatorRow(currentPage: 0, indicatorCount: 4),
          ],
        ),
      ),
    );
  }
}
