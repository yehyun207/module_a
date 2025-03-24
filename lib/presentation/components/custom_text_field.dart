import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final IconData icon;
  final String text;
  final controller;
  const CustomTextField({super.key, required this.icon, required this.text, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color(0xff9E9E9E),),
          hintText: text,
          hintStyle: TextStyle(
            color: Color(0xff9E9E9E)
          ),
          fillColor: Color(0xffFAFAFA),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          )
        ),
      ),
    );
  }
}
