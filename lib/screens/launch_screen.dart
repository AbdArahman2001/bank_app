import 'package:bank_app_flutter/prefs/UserPreferences.dart';
import 'package:bank_app_flutter/screens/home_screen.dart';
import 'package:bank_app_flutter/screens/salary/table_of_salary.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  static final routeName = "launchScreen";

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if(UserPreferences.instance.isRoutNameInit()) {
        Navigator.pushReplacementNamed(
            context, UserPreferences.instance.getRoutName());
      }else{
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.MAIN_COLOR,

      body: Center(
        child: SizedBox(
                height: 200,
                width: 240,
            child: Image.asset('assets/images/logos.png')),
      ),
    );
  }
}
