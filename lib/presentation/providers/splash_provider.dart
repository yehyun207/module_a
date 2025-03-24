import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/sign_in_screen.dart';

final splashProvider = SplashProvider();

class SplashProvider extends ChangeNotifier {

  bool isLogoStart = false;
  bool isTextStart = false;

  void animationStart(BuildContext context) async {

    await Future.delayed(Duration(seconds: 2));

    isLogoStart=true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    isTextStart = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }

}