import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fresh_and_local/features/language_selection/view/language_selection_view.dart';
import 'package:fresh_and_local/features/splash_screen/view/splash_screen_view.dart';
import 'package:fresh_and_local/utils/routes/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = jsonEncode(settings.arguments);
    switch (settings.name) {
      case RoutesName.languageSelection:
        LanguageSelectionView languageSelectionView = const LanguageSelectionView();
        return createRoute(languageSelectionView);
      case RoutesName.splashScreen:
        SplashScreenView splashScreenView = const SplashScreenView();
        return createRoute(splashScreenView);

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("No route defined")),
          );
        });
    }
  }

  static Route createRoute(navigateView) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => navigateView,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
