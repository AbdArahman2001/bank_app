import 'package:bank_app_flutter/prefs/UserPreferences.dart';
import 'package:bank_app_flutter/screens/cards/monthly_income_screen.dart';
import 'package:bank_app_flutter/screens/custom_screen/calender_custom.dart';
import 'package:bank_app_flutter/screens/custom_screen/close_button_custom.dart';
import 'package:bank_app_flutter/screens/salary/drawer/money_cash.dart';
import 'package:bank_app_flutter/screens/salary/drawer/statistics.dart';
import 'package:bank_app_flutter/screens/salary/drawer/title_drawer_custom.dart';
import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/screens/salary/drawer/yes_no_new_month_dialog.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'financial_relay_custom.dart';
import 'financial_status_update_dialog.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<HomeProvider>(builder: (context, provider, x) {
        return Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Image(
                  image: AssetImage(
                    'assets/images/logos.png',
                  ),
                  fit: BoxFit.contain,
                  height: 180,
                  width: 150,
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height,
                //   // color: AppColors.Back_Ground_COLOR,
                //   child: Image(
                //     image: AssetImage(
                //       'assets/images/logo.png',
                //     ),
                //     fit: BoxFit.contain,
                //
                //     // radius: SizeConfig.scaleHeight(48),
                //   ),
                // ),
              ),
              decoration: BoxDecoration(
                color: AppColors.MAIN_COLOR,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     SizedBox(
            //       width: 10,
            //     ),
            //     CloseButtonCustom(),
            //     Spacer(),
            //   ],
            // ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              //MediaQuery.of(context).size.height * 0.55,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TitleDrawerCustom(
                      function: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return YesNoNewMonthDialog();
                            }).then((value) async {
                          if (value is bool && value) {
                            await provider.newMonth();
                            UserPreferences.instance
                                .saveRoutName(MonthlyIncomeScreen.routeName);
                            Navigator.pushReplacementNamed(
                                context, MonthlyIncomeScreen.routeName);
                          } else {
                            Navigator.pop(context);
                          }
                        });
                      },
                      text: "A new financial month".tr(),
                      imageicon: Image(
                        color: AppColors.Drawer_COLOR,
                        image: AssetImage(
                            'assets/images/Economic_sustainability.png'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TitleDrawerCustom(
                      function: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return MoneyCashDialog();
                            });
                      },
                      text: "Add an extra amount".tr(),
                      imageicon: Image(
                        color: AppColors.Drawer_COLOR,
                        image: AssetImage('assets/images/cash (2).png'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // TitleDrawerCustom(
                    //   function: () {
                    //     showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return FinancialStatusUpdateDialog();
                    //         });
                    //   },
                    //   text: "تحديث الحالة المالية \n التوازن المالي",
                    //   imageicon: Image(
                    //     color: AppColors.Drawer_COLOR,
                    //     image: AssetImage('assets/images/refresh.png'),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    TitleDrawerCustom(
                      function: () {
                        // Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return FinancialRelayCustom();
                            });
                      },
                      text: "Financial deportation".tr(),
                      imageicon: Image(
                        color: AppColors.Drawer_COLOR,
                        image: AssetImage(
                            'assets/images/financial_investments_dollars_payment_icon_188478.png'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TitleDrawerCustom(
                      function: () {
                        // Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatisticsDialog();
                            });
                      },
                      text: "Statistic".tr(),
                      imageicon: Image(
                        color: AppColors.Drawer_COLOR,
                        image: AssetImage('assets/images/stastistic.png'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TitleDrawerCustom(
                      function: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CalenderCustom();
                          }),
                      text: "Salary descent date".tr(),
                      imageicon: Image(
                        color: AppColors.Drawer_COLOR,
                        image: AssetImage('assets/images/Icons.png'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.App_Bar_COLOR),
                      child: ExpansionTile(
                          leading: Image(
                            height: 26,
                            width: 25,
                            color: AppColors.Drawer_COLOR,
                            image: AssetImage('assets/images/language.png'),
                          ),
                          title: Text(
                            "Language".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: AppColors.MAIN_COLOR,
                            ),
                          ),
                          children: [
                            GestureDetector(
                              onTap: (){
                                provider.setLanguage(
                                            SingingCharacter.Arabic, context);
                                        Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Radio<SingingCharacter>(
                                      value: SingingCharacter.Arabic,
                                      groupValue: provider.character,
                                      onChanged: (SingingCharacter value) {
                                        provider.setLanguage(value, context);
                                        Navigator.pop(context);
                                      }),
                                  Text(
                                    'Arabic'.tr(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Segoe UI"),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                provider.setLanguage(
                                            SingingCharacter.English, context);
                                        Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Radio<SingingCharacter>(
                                      value: SingingCharacter.English,
                                      groupValue: provider.character,
                                      onChanged: (SingingCharacter value) {
                                        provider.setLanguage(value, context);
                                        Navigator.pop(context);
                                      }),
                                  Text(
                                    'English'.tr(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Segoe UI"),
                                  ),
                                ],
                              ),
                            ),
                            // GestureDetector(
                            //   child: Text(
                            //     "Arabic".tr(),
                            //     style: TextStyle(
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: 18,
                            //       color: AppColors.MAIN_COLOR,
                            //     ),
                            //   ),
                            //   onTap: () {
                            //     provider.setLanguage(
                            //         SingingCharacter.Arabic, context);
                            //     Navigator.pop(context);
                            //   },
                            // ),
                            // GestureDetector(
                            //   child: Text(
                            //     "English".tr(),
                            //     style: TextStyle(
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: 18,
                            //       color: AppColors.MAIN_COLOR,
                            //     ),
                            //   ),
                            //   onTap: () {
                            //     // context.setLocale(Locale('en'));
                            //     provider.setLanguage(
                            //         SingingCharacter.English, context);
                            //     Navigator.pop(context);
                            //   },
                            // ),
                          ]
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.App_Bar_COLOR),
                      child: ExpansionTile(
                          leading: Image(
                            height: 26,
                            width: 25,
                            color: AppColors.Drawer_COLOR,
                            image: AssetImage('assets/images/share_app.png'),
                          ),
                          title: Text(
                            "Share the app".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: AppColors.MAIN_COLOR,
                            ),
                          ),
                          children: [
                            GestureDetector(
                              child:Image(
                                image: AssetImage('assets/images/google.png'),
                                height: 50,
                              ),
                              onTap: () {
                                Share.share(
                                    "https://play.google.com/store/apps/details?id=com.mushari.gadwalratbak");
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              child: Image(
                                image: AssetImage('assets/images/apple.png'),
                                height: 50,
                              ),
                              onTap: ()  {
                                Share.share(
                                    "https://apps.apple.com/il/app/schedule-the-salary/id1603113357");
                              },
                            ),
                            SizedBox(height: 5,),
                          ]
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // TitleDrawerCustom(
                    //   function: () {
                    //     Share.share(
                    //         "https://play.google.com/store/apps/details?id=com.mushari.gadwalratbak");
                    //     print("Share app url");
                    //   },
                    //   text: "Share the app".tr(),
                    //   imageicon: Image(
                    //     color: AppColors.Drawer_COLOR,
                    //     image: AssetImage('assets/images/share_app.png'),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),

            // Spacer(),
            // Text(
            //   "All rights reserved".tr(),
            //   style: TextStyle(
            //     fontWeight: FontWeight.w400,
            //     fontSize: 13,
            //     color: Colors.black,
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "12V.736.12f",
            //   style: TextStyle(
            //     fontWeight: FontWeight.w400,
            //     fontSize: 15,
            //     color: Colors.black,
            //   ),
            // ),
            SizedBox(
              height: 25,
            ),
          ],
        );
      }),
    );
  }

// void _onDropDownItemSelected(String newValueSelected) {
//   setState(() {
//     this._currentItemSelected = newValueSelected;
//   });
// }
}
