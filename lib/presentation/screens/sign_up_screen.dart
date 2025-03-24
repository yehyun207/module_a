import 'package:flutter/material.dart';
import 'package:module_a_time/data/repositories/auth_repository.dart';
import 'package:module_a_time/presentation/components/custom_submit_button.dart';
import 'package:module_a_time/presentation/components/custom_text_field.dart';
import 'package:module_a_time/presentation/components/custom_white_button.dart';
import 'package:module_a_time/presentation/screens/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final TextEditingController _idController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();

    void signUp() async{
      final AuthRepository authRepository = AuthRepository();

      await authRepository.signUp(_idController.text, _passwordController.text, _nameController.text, context);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff393939),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 140, top: 20),
              child: Text(
                'Your information,',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 40),
            CustomTextField(icon: Icons.person, text: 'UserID', controller: _idController,),
            SizedBox(height: 10),
            CustomTextField(icon: Icons.badge, text: 'Username', controller: _nameController,),
            SizedBox(height: 10),
            CustomTextField(icon: Icons.lock, text: 'Password', controller: _passwordController,),
            SizedBox(height: 10),
            CustomTextField(icon: Icons.lock_reset, text: 'Confirm Password', controller: _confirmController,),
            SizedBox(height: 30),
            CustomSubmitButton(text: 'Sign Up', onTap: signUp),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 300,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomWhiteButton(
                    text: 'Sign In',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  CustomWhiteButton(
                    text: 'Password Reset',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('해당 기능은 아직 준비중입니다.')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
