import 'package:flutter/material.dart';
import 'package:module_a/presentation/providers/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      splashProvider.addListener(updateScreen);
      splashProvider.startAnimation(context);
    });
  }

  @override
  void dispose() {
    splashProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

        ),
      ),
    );
  }
}
