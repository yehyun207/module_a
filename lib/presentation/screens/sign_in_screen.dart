import 'package:flutter/material.dart';
import 'package:module_a_time/data/repositories/auth_repository.dart';
import 'package:module_a_time/presentation/components/custom_black_button.dart';
import 'package:module_a_time/presentation/components/custom_secure_text_field.dart';
import 'package:module_a_time/presentation/components/custom_submit_button.dart';
import 'package:module_a_time/presentation/components/custom_text_field.dart';
import 'package:module_a_time/presentation/components/custom_white_button.dart';
import 'package:module_a_time/presentation/screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  void signIn() async{

    final AuthRepository authRepository = AuthRepository();

    if(_idController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('모든 항목은 필수 입니다.')));
      return;
    }

    if(_idController.text.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('이름은 4글자 이상이어야 합니다.')));
      return;
    }

    if (_idController.text.contains(' ')) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('이름에 공백은 허용되지 않습니다.')));
      return;
    }

    if(_passwordController.text.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('비밀번호는 4글자 이상이어야 합니다.')));
      return;
    }

    await authRepository.signIn(_idController.text, _passwordController.text, context);

  }

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.black),
                child: Text(
                  'MY Health DATA',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Image.asset('assets/icons/symbol.png', width: 150, height: 150),
              SizedBox(
                height: 20,
              ),
              Text(
                'Please enter your information.',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(icon: Icons.person, text: 'Username', controller: _idController,),
              SizedBox(
                height: 10,
              ),
              CustomSecureTextField(icon: Icons.lock, text: 'Password' , controller: _passwordController,),
              SizedBox(
                height: 30,
              ),
              CustomSubmitButton(text: 'Sign In', onTap: signIn,),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffFAFAFA)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomBlackButton(text: "Sign Up", onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },),
                    SizedBox(
                      height: 10,
                    ),
                    CustomWhiteButton(text: 'Password Reset', onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('해당 기능은 아직 준비중입니다.')));
                    },)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
