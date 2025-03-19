import 'package:flutter/material.dart';

class CustomConfirmButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const CustomConfirmButton({
    super.key,
    required this.onTap,
    required this.text,
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
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
