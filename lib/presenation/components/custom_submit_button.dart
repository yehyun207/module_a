import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const CustomSubmitButton({
    super.key,
    required this.text, required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(onTap != null) {
          onTap!();
        }
      },
      child: Container(
        width: 320,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xff393939),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
