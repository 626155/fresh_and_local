import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (_) => HomeScreen()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            color: Colors.blue, // Change to your background color
            child: Center(
              child: AnimatedOpacity(
                opacity: _showLogo ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  'assets/splash.png', // Replace with your logo image asset
                  width: 200.0,
                  height: 200.0,
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