import 'package:flutter/material.dart';
import 'package:module_a/common/color.dart';
import 'package:module_a/presentation/components/custom_confirm_button.dart';
import 'package:module_a/presentation/components/custom_textfield.dart';
import 'package:module_a/presentation/screens/profile_target_screen.dart';
import 'package:module_a/presentation/screens/signin_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff393939),
          title: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 125, top: 20),
              child: Text(
                'Your information,',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 28,
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            CustomTextfield(iconData: Icons.person, hintText: 'UserID'),
            SizedBox(
              height: 10,
            ),
            CustomTextfield(iconData: Icons.tag, hintText: 'Username'),
            SizedBox(
              height: 10,
            ),
            CustomTextfield(iconData: Icons.lock, hintText: 'Password'),
            SizedBox(
              height: 10,
            ),
            CustomTextfield(iconData: Icons.lock_reset, hintText: 'Confirm Password'),
            SizedBox(
              height: 30,
            ),
            CustomConfirmButton(buttonTitle: 'Sign Up', pageBuilder: () => ProfileTargetScreen()),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffF9F9F9)
              ),
            )
          ],
        ),
      ),
    );
  }
}
