import 'package:flutter/material.dart';


class SplashScreenView extends StatelessWidget {

  const SplashScreenView({super.key});




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
                duration: const Duration(seconds: 5),
                opacity: 0.0,
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