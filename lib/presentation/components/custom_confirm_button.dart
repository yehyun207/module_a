import 'package:flutter/material.dart';

class CustomConfirmButton extends StatelessWidget {
  final String buttonTitle;
  final Widget Function() pageBuilder;

  const CustomConfirmButton({
    super.key,
    required this.buttonTitle,
    required this.pageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => pageBuilder()));
      },
      child: Container(
        width: 330,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xff393939),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
