

import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {

  final Function()? onTap;
  final String text;
  const CustomSubmitButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(onTap != null) {
          onTap!();
        }
      },
      child: Container(
        width: 330,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color(0xff393939),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.w800,
            fontSize: 14
          ),
        ),
      ),
    );
  }
}
