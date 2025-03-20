import 'package:flutter/material.dart';

class CustomBlackButton extends StatelessWidget {
  final String text;
  final Widget Function() pageBuilder;

  const CustomBlackButton({super.key, required this.text, required this.pageBuilder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => pageBuilder()));
      },
      child: Container(
        width: 280,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(3)),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
