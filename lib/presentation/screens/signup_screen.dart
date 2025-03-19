import 'package:flutter/material.dart';
import 'package:module_a/presentation/components/custom_confirm_button.dart';
import 'package:module_a/presentation/components/custom_textfield.dart';
import 'package:module_a/presentation/components/custom_white_button.dart';
import 'package:module_a/presentation/screens/profile_target_screen.dart';
import 'package:module_a/presentation/screens/signin_screen.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool _isLoading = false;
  
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();

   _signUp() async {
     debugPrint("signup function called");

    final uri = Uri.parse("http://api.db.pe.kr:51091/api/authenticate/signup");
    final request = http.MultipartRequest('POST', uri);

    request.fields['mberId'] = _idController.text;
    request.fields['mberPassword'] = _passwordController.text;
    request.fields['mberNm'] = _nameController.text;

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if(response.statusCode == 200) {
      _isLoading = true;
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileTargetScreen()));
    } else {
      debugPrint("회원가입 실패");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff393939),
        centerTitle: true,
        title: Text('Sign Up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 140, top: 15),
              child: Text(
                'Your information,',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextfield(iconData: Icons.person, hintText: 'UserID', controller: _idController,),
            CustomTextfield(iconData: Icons.tag, hintText: 'Username', controller: _nameController,),
            CustomTextfield(iconData: Icons.lock, hintText: 'Password', controller: _passwordController,),
            CustomTextfield(iconData: Icons.lock_reset, hintText: 'Confirm Password', controller: _confirmpasswordController,),
            SizedBox(
              height: 30,
            ),
            CustomConfirmButton(onTap: _signUp, text: 'Sign Up'),
            SizedBox(
              height: 80,
            ),
            Container(
              width: double.infinity,
              height: 259,
              color: Color(0xffFAFAFA),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomWhiteButton(buttonTitle: 'Sign In', pageBuilder: () => SigninScreen()),
                  SizedBox(
                    height: 20,
                  ),
                  CustomWhiteButton(buttonTitle: 'Password Reset', pageBuilder: () => SigninScreen())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
