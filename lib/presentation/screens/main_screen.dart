import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:module_a/presentation/screens/workout_screen.dart';

import 'alarm_screen.dart';
import 'home_screen.dart';
import 'mypage_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _screens = [
    HomeScreen(),
    AlarmScreen(),
    WorkoutScreen(),
    MypageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home-1-svgrepo-com.svg',
              width: 50,
              height: 50,
              color: _currentIndex == 0 ? Colors.white : Colors.grey,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/alarm-clock-svgrepo-com.svg',
              width: 50,
              height: 50,
              color: _currentIndex == 1 ? Colors.white : Colors.grey,
            ),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/run-on-treadmill-exercise-work-out-run-svgrepo-com.svg',
              width: 50,
              height: 50,
              color: _currentIndex == 2 ? Colors.white : Colors.grey,
            ),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user-svgrepo-com.svg',
              width: 50,
              height: 50,
              color: _currentIndex == 3 ? Colors.white : Colors.grey,
            ),
            label: 'Mypage',
          ),
        ],
      ),
    );
  }
}
