import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTargetScreen extends StatefulWidget {
  const ProfileTargetScreen({super.key});

  @override
  State<ProfileTargetScreen> createState() => _ProfileTargetScreenState();
}

class _ProfileTargetScreenState extends State<ProfileTargetScreen> {
  final String _userName = '';

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // _userName = prefs.getString('user_name') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
