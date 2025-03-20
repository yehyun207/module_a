import 'package:flutter/material.dart';
import 'package:module_a/presenation/providers/splash_provider.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: splashProvider.isLogoStart ? 1 : 0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/images/symbol.png'),
            ),
            SizedBox(height: 30),
            AnimatedOpacity(
              opacity: splashProvider.isTextStart ? 1 : 0,
              duration: Duration(seconds: 1),
              child: Text(
                'MY Health DATA',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
