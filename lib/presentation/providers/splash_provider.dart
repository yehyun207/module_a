import 'package:flutter/material.dart';
import '../screens/signin_screen.dart';

final splashProvider = SplashProvider();

class SplashProvider extends ChangeNotifier {

  bool isStartLogoAnimation = false;
  bool isStartTextAnimation = false;

  void startAnimation(BuildContext context) async{
    isStartLogoAnimation = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1, milliseconds: 500));

    isStartTextAnimation = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SigninScreen()));
  }
}