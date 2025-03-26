import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfileTextField extends StatelessWidget {
  final String svgIconPath;
  final String hintText;
  final String? suffixText;
  final TextEditingController? controller;

  const CustomProfileTextField({
    Key? key,
    required this.svgIconPath,
    required this.hintText,
    this.suffixText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              svgIconPath,
              width: 24,
              height: 24,
              color: const Color(0xff9E9E9E),
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xff9E9E9E),
          ),
          suffixText: suffixText,
          suffixStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          fillColor: const Color(0xffFAFAFA),
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
