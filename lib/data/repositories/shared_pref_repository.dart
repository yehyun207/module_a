import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserName(String name) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_name', name);
} 