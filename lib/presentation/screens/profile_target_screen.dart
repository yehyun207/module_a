import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:module_a_time/presentation/components/custom_profile_text_field.dart';
import 'package:module_a_time/presentation/components/custom_submit_button.dart';
import 'package:module_a_time/presentation/components/custom_text_field.dart';
import 'package:module_a_time/presentation/screens/sign_in_screen.dart';

class ProfileTargetScreen extends StatefulWidget {
  const ProfileTargetScreen({Key? key}) : super(key: key);

  @override
  State<ProfileTargetScreen> createState() => _ProfileTargetScreenState();
}

class _ProfileTargetScreenState extends State<ProfileTargetScreen> {
  bool _isMaleSelected = true;

  final TextEditingController _competitorController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _stepsController = TextEditingController();
  final TextEditingController _waterController = TextEditingController();

  @override
  void dispose() {
    _competitorController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _birthController.dispose();
    _stepsController.dispose();
    _waterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff393939),
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            'Profile & Target',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                // 상단 인사
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hi username99',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Profile,',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _genderSelectButton(
                      label: 'Male',
                      isSelected: _isMaleSelected,
                      onTap: () {
                        setState(() {
                          _isMaleSelected = true;
                        });
                      },
                      svgPath:
                          'assets/icons/man_FILL0_wght400_GRAD0_opsz24.svg',
                    ),
                    const SizedBox(width: 16),
                    _genderSelectButton(
                      svgPath:
                          'assets/icons/woman_FILL0_wght400_GRAD0_opsz24.svg',
                      label: 'Female',
                      isSelected: !_isMaleSelected,
                      onTap: () {
                        setState(() {
                          _isMaleSelected = false;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
               CustomTextField(icon: Icons.person, text: 'Competitor 99'),
                const SizedBox(height: 12),
                CustomProfileTextField(
                  svgIconPath: 'assets/icons/height-svgrepo-com.svg',
                  hintText: '182.5                                           cm',
                  controller: _heightController,
                ),
                const SizedBox(height: 12),
                CustomProfileTextField(
                  svgIconPath: 'assets/icons/weight-svgrepo-com.svg',
                  hintText: '80.5                                              kg',
                  controller: _weightController,
                ),
                const SizedBox(height: 12),
                CustomProfileTextField(hintText: '1986.09.30', svgIconPath: 'assets/icons/cake-svgrepo-com.svg',),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Target,',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomProfileTextField(
                  svgIconPath:
                      'assets/icons/footprint_FILL0_wght400_GRAD0_opsz24.svg',
                  hintText: '5,000                                        Steps',
                  controller: _stepsController,
                ),
                const SizedBox(height: 12),
                CustomProfileTextField(
                  svgIconPath:
                      'assets/icons/water_drop_FILL0_wght400_GRAD0_opsz24.svg',
                  hintText: '2,000                                              ml',
                  controller: _waterController,
                ),
                const SizedBox(height: 30),
                CustomSubmitButton(
                  text: 'Complete',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _genderSelectButton({
    required String svgPath,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: isSelected ? Color(0xffFAFAFA) : Color(0xffFAFAFA),
              borderRadius: BorderRadius.circular(8),
              border:
                  isSelected
                      ? Border.all(color: Colors.black, width: 2)
                      : Border.all(color: Colors.transparent),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    svgPath,
                    color: isSelected ? Colors.black : Colors.grey,
                    width: 100, // 원하는 너비 지정
                    height: 80, // 원하는 높이 지정
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.grey,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
