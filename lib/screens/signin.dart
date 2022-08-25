import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utlies/app_colors.dart';
import 'package:provider/provider.dart';

import '../prefs/UserPreferences.dart';
import '../providers/home_provider.dart';
import 'home_screen.dart';
enum LoginState{
  Live,Test
}
ValueNotifier<LoginState> loginState = ValueNotifier(LoginState.Live);
class SignIn extends StatelessWidget {
  static const routeName = "SignIn";

  const SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.MAIN_COLOR,
        body: Consumer<HomeProvider>(builder: (context, provider, x) {
      return Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                width: 240,
                child: Image.asset('assets/images/schedual.png')),
            SizedBox(height: 60,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) =>AppColors.MAIN_COLOR),
                fixedSize: MaterialStateProperty.resolveWith((states) => Size(200,50)),
                  shape: MaterialStateProperty.resolveWith(
                      (states) => StadiumBorder(side: BorderSide(color: AppColors.Border_COLOR)))),
              onPressed: () async=>await provider.signInWithGoogle(context: context),
              child: Text("sing_in".tr()),
            ),
            SizedBox(height: 20,),
            Visibility(
              visible: DateTime.now().isBefore(DateTime(2022,8,22)),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) =>AppColors.MAIN_COLOR),
                  fixedSize: MaterialStateProperty.resolveWith((states) => Size(200,50)),
                    shape: MaterialStateProperty.resolveWith(
                        (states) => StadiumBorder(side: BorderSide(color: AppColors.Border_COLOR)))),
                onPressed: () {
                 loginState.value = LoginState.Test;
                 if (UserPreferences.instance.isRoutNameInit()) {
                   Navigator.pushReplacementNamed(
                       context, UserPreferences.instance.getRoutName());
                 } else {
                   Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                 }
                },
                child: Text("Test Login"),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
