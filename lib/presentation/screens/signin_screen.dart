import 'package:flutter/material.dart';
import 'package:module_a/common/color.dart';
import 'package:module_a/presentation/components/custom_black_button.dart';
import 'package:module_a/presentation/components/custom_confirm_button.dart';
import 'package:module_a/presentation/components/custom_textfield.dart';
import 'package:module_a/presentation/components/custom_white_button.dart';
import 'package:module_a/presentation/screens/profile_target_screen.dart';
import 'package:module_a/presentation/screens/signup_screen.dart';
import 'package:http/http.dart' as http;

import 'main_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn() async {
    // 실제 서버 로그인 엔드포인트로 변경하세요.
    final uri =
    Uri.parse("http://api.db.pe.kr:51091/api/authenticate/signin");

    // multipart/form-data 형식의 요청 생성
    var request = http.MultipartRequest('POST', uri);
    request.fields['mberId'] = _idController.text;
    request.fields['mberPassword'] = _passwordController.text;

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        // 로그인 성공 시 처리 (예시: ProfileTargetScreen으로 이동)
        print('Sign-in success: ${response.body}');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileTargetScreen()),
        );
      } else {
        // 로그인 실패 시 AlertDialog로 에러 표시
        print('Sign-in failed: ${response.statusCode}');
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Sign-in Failed'),
            content: Text('Error code: ${response.statusCode}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              )
            ],
          ),
        );
      }
    } catch (e) {
      // 네트워크 등 예외 발생 시 AlertDialog로 에러 표시
      print('Sign-in error: $e');
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'My Health DATA',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/symbol.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Please enter your information.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                CustomTextfield(
                  iconData: Icons.person,
                  hintText: 'UserID',
                  controller: _idController,
                ),
                CustomTextfield(
                  iconData: Icons.lock,
                  hintText: 'Password',
                  controller: _passwordController,
                ),
                const SizedBox(height: 50),
                CustomConfirmButton(onTap: null, text: 'Sign Up'),
                // 로그인 버튼: _signIn 함수 호출
                const SizedBox(height: 50),
                // 회원가입 버튼: SignupScreen으로 이동
                CustomBlackButton(
                  buttonTitle: 'Sign Up',
                  pageBuilder: () => const MainScreen(),
                ),
                const SizedBox(height: 10),
                // 비밀번호 초기화 버튼 (추후 PasswordResetScreen으로 연결)
                CustomWhiteButton(
                  buttonTitle: 'Password Reset',
                  pageBuilder: () => const SignupScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
