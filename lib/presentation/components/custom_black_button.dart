import 'package:flutter/material.dart';

class CustomBlackButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const CustomBlackButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(onTap!=null) {
          onTap!();
        }
      },
      child: Container(
        width: 280,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontFamily: 'NotoSans',
            fontSize: 20
          ),
        ),
      ),
    );
  }
}
