import 'package:flutter/material.dart';
import 'package:module_a/common/color.dart';
import 'package:module_a/presentation/components/custom_black_button.dart';
import 'package:module_a/presentation/components/custom_confirm_button.dart';
import 'package:module_a/presentation/components/custom_textfield.dart';
import 'package:module_a/presentation/components/custom_white_button.dart';
import 'package:module_a/presentation/screens/signup_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('My Health DATA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/symbol.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Please enter your information.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextfield(iconData: Icons.person, hintText: 'UserID'),
              CustomTextfield(iconData: Icons.lock, hintText: 'Password'),
              SizedBox(
                height: 50,
              ),
              CustomConfirmButton(buttonTitle: 'Sign In', pageBuilder: () => SignupScreen()),
              SizedBox(
                height: 50,
              ),
              CustomBlackButton(buttonTitle: 'Sign Up', pageBuilder: () => SignupScreen()),
              SizedBox(height: 10,),
              CustomWhiteButton(buttonTitle: 'Password Reset', pageBuilder: () => SignupScreen())
            ],
          ),
        ),
      ),
    );
  }
}
