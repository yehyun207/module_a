import 'package:flutter/material.dart';
import 'package:module_a_time/presentation/providers/splash_provider.dart';

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
      splashProvider.animationStart(context);
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
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: splashProvider.isLogoStart ? 1 : 0,
              duration: Duration(seconds: 1),
              child: Image.asset(
                'assets/icons/symbol.png',
              ),
            ),
            AnimatedOpacity(opacity: splashProvider.isTextStart ? 1 : 0, duration: Duration(seconds: 1),
            child: Text(
              'MY Health DATA',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'NotoSans',
                fontSize: 28,
                fontWeight: FontWeight.w800
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
