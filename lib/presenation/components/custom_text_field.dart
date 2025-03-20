import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final IconData iconData;
  final String hintText;
  final controller;

  const CustomTextField({super.key,required this.iconData, required this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData, color: Color(0xff9E9E9E),),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xff9E9E9E)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none
          )
        ),
      ),
    );
  }
}
