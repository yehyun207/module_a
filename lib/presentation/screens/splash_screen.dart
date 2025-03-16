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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: splashProvider.isStartLogoAnimation ? 1 : 0,
              duration: Duration(seconds: 2),
              child: Image.asset(
                'assets/images/symbol.png',
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: splashProvider.isStartTextAnimation ? 1 : 0,
              duration: Duration(seconds: 2),
              child: Text(
                'MY Health DATA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
