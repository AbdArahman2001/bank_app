import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/screens/custom_screen/all_numbers_custom.dart';
import 'package:bank_app_flutter/screens/custom_screen/close_button_custom.dart';
import 'package:bank_app_flutter/screens/custom_screen/custom_button.dart';
import 'package:bank_app_flutter/screens/custom_screen/star_red_custom.dart';
import 'package:bank_app_flutter/screens/custom_screen/type_add_or_remove_custom.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRemoveCalculate extends StatelessWidget {
  String text;
  String textbutton;
  String SurplusOrDeficit;
  String EnterSurplusOrDeficit;
  String ValueAfterSurplusOrDeficit;

  AddRemoveCalculate(
      {this.text,
      this.textbutton,
      this.SurplusOrDeficit,
      this.EnterSurplusOrDeficit,
      this.ValueAfterSurplusOrDeficit});

  HomeProvider provider;
  String resuls;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeProvider>(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.Border_COLOR),
          borderRadius: BorderRadius.circular(20),
          color: AppColors.bg_COLOR,
        ),
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 16),
        width: 272,
        height: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  SurplusOrDeficit,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: "Segoe UI",
                    fontWeight: FontWeight.w900,
                    color: AppColors.MAIN_COLOR,
                  ),
                ),
                SizedBox(
                  width: 69,
                ),
                CloseButtonCustom(),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 36,
              width: 174,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: AppColors.Border_COLOR, spreadRadius: 1),
                ],
              ),
            ),
            // SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StarRedCustom(
                        isHidden: true,
                      ),
                      Row(children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          EnterSurplusOrDeficit,
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w900,
                            color: AppColors.MAIN_COLOR,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 8,
                      ),
                      TypeAddOrRemoveCustom(provider.result),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StarRedCustom(
                        isHidden: false,
                      ),
                      Row(children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          ValueAfterSurplusOrDeficit,
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w900,
                            color: AppColors.MAIN_COLOR,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 8,
                      ),
                      TypeAddOrRemoveCustom(""),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 171,
              height: 212,
              child: AllNumbersCustom(),
            ),
            SizedBox(
              height: 16,
            ),
            CustomButton(
              function: () {
                text = provider.result;
                provider.clearNumber();
                Navigator.pop(context,text);
              },
              title: textbutton,
            ),
            // SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
