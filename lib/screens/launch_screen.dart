import 'dart:io';

import 'package:bank/screens/purchase_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../model/app_user.dart';
import '../../../providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../prefs/UserPreferences.dart';
import '../../../screens/home_screen.dart';
import '../../../screens/signin.dart';
import '../../../screens/subscription_screen.dart';
import '../../../screens/salary/table_of_salary.dart';
import '../../../utlies/app_colors.dart';
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
    if (FirebaseAuth.instance.currentUser != null) {
      Provider.of<HomeProvider>(context, listen: false).getCurrentUser().then(
          (value) => Provider.of<HomeProvider>(context, listen: false)
              .getIsSubscribed());
    }

    Future.delayed(Duration(seconds: 2), () {
      if (FirebaseAuth.instance.currentUser != null) {
        if (Provider.of<HomeProvider>(context, listen: false).isSubscribed) {
          if (UserPreferences.instance.isRoutNameInit()) {
            Navigator.pushReplacementNamed(
                context, UserPreferences.instance.getRoutName());
          } else {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }
        } else {
          Navigator.pushReplacementNamed(context, PurchaseScreen.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, SignIn.routeName);
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
            child: Image.asset('assets/images/schedual.png')),
      ),
    );
  }
}
