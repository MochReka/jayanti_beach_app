import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:jayanti_beach_app/Screens/welcome-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/splash.png',
            width: 200,
          ),
          const Text(
            'Jayanti Beach Explorer',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      splashIconSize: 400,
      splashTransition: SplashTransition.fadeTransition,
      duration: 2000,
      backgroundColor: Color.fromARGB(255, 2, 133, 255),
      nextScreen: const WelcomeScreen(),
    );
  }
}
