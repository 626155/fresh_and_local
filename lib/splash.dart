import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_and_local/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool _showLogo = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _showLogo = true;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) =>SliderScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            //color: Colors.blue, // Change to your background color
            child: Center(
              child: AnimatedOpacity(
                opacity: _showLogo ? 1.0 : 0.0,
                duration: const Duration(seconds: 2),
                child: Image.asset(
                  'assets/images/splash.png', // Replace with your logo image asset
                  width: 500.0,
                  height: 500.0,
                ),
              ),
            ),
          ),
          // Add other widgets on top of the logo if needed
        ],
      ),
    );
  }
}