import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/screens/cards/monthly_income_screen.dart';
import 'package:bank_app_flutter/screens/custom_screen/all_numbers_custom.dart';
import 'package:bank_app_flutter/screens/custom_screen/close_button_custom.dart';
import 'package:bank_app_flutter/screens/custom_screen/custom_button.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculateScreen extends StatefulWidget {
  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}
class _CalculateScreenState extends State<CalculateScreen> {
  HomeProvider provider;
String text;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    provider.result = "0";
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeProvider>(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.Border_COLOR ),
          borderRadius: BorderRadius.circular(20),
          color: AppColors.bg_COLOR,
        ),
        padding: EdgeInsets.only(top: 21, bottom: 8),
        width: 272,
        height: 349,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 16,),
                CloseButtonCustom(),
                SizedBox(width: 16,),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    height: 36,
                    width: 174,
                    child: Center(
                      child: Text(
                        provider.getClacResult(),
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w900,
                          color: AppColors.MAIN_COLOR,
                        ),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: AppColors.Border_COLOR, spreadRadius: 1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 22,
            ),
            SizedBox(
              width: 171,
              height: 212,
              child: AllNumbersCustom(),
            ),
            Spacer(),
            CustomButton(
               function: () {
                 text = provider.result;
                 provider.clearNumber();
                 Navigator.pop(context,text);
               },
              title: "ADD",
            ),
            // SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
