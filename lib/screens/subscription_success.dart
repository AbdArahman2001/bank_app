import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../screens/home_screen.dart';
import '../../../utlies/app_colors.dart';

class SubscriptionSuccess extends StatelessWidget {
  const SubscriptionSuccess({Key key}) : super(key: key);
  static const routeName = "subscription_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/success.png"),
            SizedBox(
              height: 60,
            ),
            Text("Success Subscription".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(text: "Your",style:TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.w500, fontFamily: "Segoe UI",),children: [
                TextSpan(text: " Visa •••• 2568 with Google Pay",style:TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.w600, fontFamily: "Segoe UI",)),
               //TextSpan(text: ""),
              ]),

            ),
           Text("was successfully charged",textAlign:TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:Colors.black,fontFamily: "Segoe UI"),),
           SizedBox(height: 30,),
            TextButton.icon(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(HomeScreen.routeName),
              icon: Icon(Icons.arrow_back,color: AppColors.MAIN_COLOR,),
              label: Text("go to app".tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.MAIN_COLOR,
                    fontSize: 16,
                    fontFamily: "Segoe UI",
                    fontWeight: FontWeight.w600,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
