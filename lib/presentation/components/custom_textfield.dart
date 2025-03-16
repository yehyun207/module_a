import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final IconData iconData;
  final String hintText;
  const CustomTextfield({super.key, required this.iconData, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 25, left: 25),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(iconData, color: Color(0xff9E9E9E),),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xff9E9E9E)
          ),
          fillColor: Color(0xffFAFAFA),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Color(0xffFAFAFA))
          )
        ),
      ),
    );
  }
}
