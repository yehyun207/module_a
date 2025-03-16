import 'package:flutter/material.dart';
import 'package:module_a/common/color.dart';

class ProfileTargetScreen extends StatelessWidget {
  const ProfileTargetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appbarColor,
          centerTitle: true,
          title: Text(
            'Profile & Target',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
          ),
        ),
      ),
    );
  }
}
