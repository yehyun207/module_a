import 'package:flutter/material.dart';

class CustomWhiteButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const CustomWhiteButton({super.key, this.onTap, required this.text});

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
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'NotoSans',
            fontSize: 20
          ),
        ),
      ),
    );
  }
}
