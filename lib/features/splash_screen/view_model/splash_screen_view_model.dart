import 'dart:async';
import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../intro_screen.dart';

class SplashScreeViewModel extends ChangeNotifier { 

  onInit(){
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context as BuildContext).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>SliderScreen())
        )
      });

  }
}