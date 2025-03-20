import 'package:flutter/material.dart';
import 'package:module_a/data/repositories/shared_pref_repository.dart';
import 'package:module_a/presenation/components/custom_submit_button.dart';
import 'package:module_a/presenation/components/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:module_a/presenation/components/custom_white_button.dart';
import 'package:module_a/presenation/screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
   
  void _signUp() async{
    final uri = Uri.parse("http://api.db.pe.kr:51091/api/authenticate/signup");
    var request = http.MultipartRequest('POST', uri);

    request.fields['mberId'] = _idController.text;
    request.fields['mberPassword'] = _passwordController.text;
    request.fields['mberNm'] = _nameController.text;

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if(response.statusCode == 200) {
      await saveUserName(_nameController.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Color(0xff393939),
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 180, top: 20),
            child: Text(
              'Your information,',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextField(iconData: Icons.person, hintText: 'UserID', controller: _idController,),
          CustomTextField(iconData: Icons.tag, hintText: 'Username', controller: _nameController,),
          CustomTextField(iconData: Icons.lock, hintText: 'Password', controller: _passwordController,),
          CustomTextField(iconData: Icons.lock_reset, hintText: 'Confirm Password', controller: _confirmController,),
          SizedBox(
            height: 50,
          ),
          CustomSubmitButton(text: 'Sign Up', onTap: _signUp,),
          SizedBox(
            height: 70,
          ),
          Container(
            width: double.infinity,
            height: 247,
            color: Color(0xffFAFAFA),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomWhiteButton(text: 'Sign In'),
                SizedBox(
                  height: 20,
                ),
                CustomWhiteButton(text: 'Password Reset')
              ],
            ),
          )
        ],
      ),
    );
  }
}
