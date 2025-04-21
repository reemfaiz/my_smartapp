import 'package:flutter/material.dart';
import 'package:my_smartapp/helpers/navigator.dart';
import 'package:my_smartapp/views/onboarding_screens/onboarding_1.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      context.removeUntil(view: OnBoardingOneView());
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 224, 197, 247), Colors.white],
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/images/Ellipse_3.png'),
            ),
            Expanded(
              child: Center(child: Image.asset('assets/images/logo_text.png')),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/images/Ellipse_2.png'),
            ),
          ],
        ),
      ),
    );
  }
}
