import 'package:bank_app_flutter/prefs/UserPreferences.dart';
import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/screens/cards/monthly_income_screen.dart';
import 'package:bank_app_flutter/screens/custom_screen/star_red_custom.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

import 'cards/cards_screen.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = "homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      Provider.of<HomeProvider>(context, listen: false).getLanguage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Back_Ground_COLOR,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Language and Date".tr(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Segoe UI",
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              if(Provider.of<HomeProvider>(context, listen: false).monthList.salaryDate == null) {
                final snackBar = SnackBar(
                    backgroundColor: AppColors.Snack_Bar_COLOR,
                    content: Text(
                      "Salary release date must be entered".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Segoe UI"),
                    ));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }else {
                Provider.of<HomeProvider>(context, listen: false).saveList();
                UserPreferences.instance.saveRoutName(MonthlyIncomeScreen.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MonthlyIncomeScreen()),
                );
              }
            },
          ),
        ],
      ),
      body: Consumer<HomeProvider>(builder: (context, provider, x) {
        return Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 22),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 162,
                width: 206,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/Plain credit card-amico.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.language,
                    color: Colors.black,
                    size: 21,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  StarRedCustom(
                    isHidden: true,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "اللغة - Language".tr(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: AppColors.Border_COLOR, spreadRadius: 1),
                  ],
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Radio<SingingCharacter>(
                            value: SingingCharacter.Arabic,
                            groupValue: provider.character,
                            onChanged: (SingingCharacter value) {
                              provider.setLanguage(value, context);
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
                    Spacer(),
                    Row(
                      children: [
                        Radio<SingingCharacter>(
                            value: SingingCharacter.English,
                            groupValue: provider.character,
                            onChanged: (SingingCharacter value) {
                              provider.setLanguage(value, context);
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
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage("assets/images/cakendar.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  StarRedCustom(
                    isHidden: true,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "تاريخ نزول الراتب - Salary descent date".tr(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  provider.setDate(context);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: AppColors.Border_COLOR, spreadRadius: 1),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        provider.monthList.salaryDate != null
                            ? provider.monthList.salaryDate
                            : "YYYY/MM/DD",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Segoe UI"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      // Text(
                      //   inputFormat.format(DateTime.fromMillisecondsSinceEpoch(),),
                      // ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              // Container(
              //   // padding: EdgeInsets.only(left: 16, right: 16),
              //   child: Row(
              //     children: [
              //       Spacer(),
              //       GestureDetector(
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => MonthlyIncomeScreen()),
              //           );
              //         },
              //         child: Column(
              //           children: [
              //             SizedBox(
              //               child: Icon(
              //                 Icons.arrow_forward,
              //                 color: AppColors.Next_Back_COLOR,
              //                 size: 30.0,
              //               ),
              //               width: 29,
              //               height: 43,
              //             ),
              //             Text(
              //               "التالي",
              //               style: TextStyle(
              //                   color: AppColors.Next_Back_COLOR,
              //                   fontSize: 13,
              //                   fontFamily: "Segoe UI",
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
              //       ),
              //
              //
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
            ],
          ),
        );
      }),
    );
  }
}
