import 'package:flutter/material.dart';
import 'package:module_a/presenation/components/custom_black_button.dart';
import 'package:module_a/presenation/components/custom_submit_button.dart';
import 'package:module_a/presenation/components/custom_text_field.dart';
import 'package:module_a/presenation/components/custom_white_button.dart';
import 'package:module_a/presenation/screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                'MY Health DATA',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 30),
            Image.asset('assets/images/symbol.png', width: 150, height: 150),
            SizedBox(height: 30),
            Text(
              'Please enter your information.',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextField(iconData: Icons.person, hintText: 'UserID'),
            CustomTextField(iconData: Icons.lock, hintText: 'Password'),
            SizedBox(
              height: 50,
            ),
            CustomSubmitButton(text: 'Sign In',onTap: () {  },),
            SizedBox(
              height: 30,
            ),
            CustomBlackButton(text: 'Sign Up', pageBuilder: () => SignUpScreen()),
            SizedBox(
              height: 10,
            ),
            CustomWhiteButton(text: 'Password Reset')
          ],
        ),
      ),
    );
  }
}
