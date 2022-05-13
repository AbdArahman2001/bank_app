import 'package:bank_app_flutter/prefs/UserPreferences.dart';
import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/screens/cards/monthly_income_screen.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_screen/video_story.dart';

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
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.arrow_forward),
        //     onPressed: () {
        //       if(Provider.of<HomeProvider>(context, listen: false).monthList.salaryDate == null) {
        //         final snackBar = SnackBar(
        //             backgroundColor: AppColors.Snack_Bar_COLOR,
        //             content: Text(
        //               "Salary release date must be entered".tr(),
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                   fontSize: 20,
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.w500,
        //                   fontFamily: "Segoe UI"),
        //             ));
        //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //       }else {
        //         Provider.of<HomeProvider>(context, listen: false).saveList();
        //         UserPreferences.instance.saveRoutName(MonthlyIncomeScreen.routeName);
        //         Navigator.pushReplacementNamed(
        //           context,
        //             MonthlyIncomeScreen.routeName
        //         );
        //       }
        //     },
        //   ),
        // ],
      ),
      body: (Provider.of<HomeProvider>(context).monthList == null)
          ? CircularProgressIndicator()
          : Consumer<HomeProvider>(builder: (context, provider, x) {
              return Container(
                // padding: EdgeInsets.only(left: 16, right: 16, top: 22),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Container(
                    //   height: 162,
                    //   width: 206,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image:
                    //           AssetImage("assets/images/Plain credit card-amico.png"),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 21,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.language,
                            color: Colors.black,
                            size: 21,
                          ),
                          // SizedBox(
                          //   width: 4,
                          // ),
                          // StarRedCustom(
                          //   isHidden: true,
                          // ),
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.Border_COLOR, spreadRadius: 1),
                        ],
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // provider.setLanguage(
                              //     SingingCharacter.English, context);
                            },
                            child: Row(
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
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              // provider.setLanguage(
                              //     SingingCharacter.Arabic, context);
                            },
                            child: Row(
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
                    Container(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          // SizedBox(
                          //   width: 4,
                          // ),
                          // StarRedCustom(
                          //   isHidden: true,
                          // ),
                          SizedBox(
                            width: 4,
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Text(
                              "أدخل تاريخ نزول الراتب - Enter salary descent date"
                                  .tr(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        provider.setDate(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.Border_COLOR, spreadRadius: 1),
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
                                  color: provider.monthList.salaryDate == null
                                      ? Colors.red
                                      : Colors.black,
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
                    Container(
                      // padding: EdgeInsets.only(left: 16, right: 16),
                      height: 100,
                      // color: Colors.red,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, HomeScreen.routeName);
                              },
                              child: Container(
                                  // color: Colors.red,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Container(

                                // color: Colors.yellow,
                                ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Colors.transparent,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        if (Provider.of<HomeProvider>(context,
                                                    listen: false)
                                                .monthList
                                                .salaryDate ==
                                            null) {
                                          final snackBar = SnackBar(
                                              backgroundColor:
                                                  AppColors.Snack_Bar_COLOR,
                                              content: Text(
                                                "Salary release date must be entered"
                                                    .tr(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Segoe UI"),
                                              ));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        } else {
                                          Provider.of<HomeProvider>(context,
                                                  listen: false)
                                              .saveList();
                                          UserPreferences.instance.saveRoutName(
                                              MonthlyIncomeScreen.routeName);
                                          Navigator.pushReplacementNamed(
                                              context,
                                              MonthlyIncomeScreen.routeName);
                                          if (!UserPreferences.instance
                                              .isVideoInit()) {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return VideoStoryScreen(
                                                  'first'.tr());
                                            }));
                                          }
                                        }
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.MAIN_COLOR,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Next".tr(),
                                    style: TextStyle(
                                        color: AppColors.MAIN_COLOR,
                                        fontSize: 15,
                                        fontFamily: "Segoe UI",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // Text(
                                  //   "Add Item".tr(),
                                  //   style: TextStyle(
                                  //       fontSize: 15,
                                  //       color: AppColors.MAIN_COLOR,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                ],
                              ),
                              // color: Colors.yellow,
                            ),
                          ),
                          // Expanded(
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       if (Provider.of<HomeProvider>(context,
                          //                   listen: false)
                          //               .monthList
                          //               .salaryDate ==
                          //           null) {
                          //         final snackBar = SnackBar(
                          //             backgroundColor:
                          //                 AppColors.Snack_Bar_COLOR,
                          //             content: Text(
                          //               "Salary release date must be entered"
                          //                   .tr(),
                          //               textAlign: TextAlign.center,
                          //               style: TextStyle(
                          //                   fontSize: 20,
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.w500,
                          //                   fontFamily: "Segoe UI"),
                          //             ));
                          //         ScaffoldMessenger.of(context)
                          //             .showSnackBar(snackBar);
                          //       } else {
                          //         Provider.of<HomeProvider>(context,
                          //                 listen: false)
                          //             .saveList();
                          //         UserPreferences.instance.saveRoutName(
                          //             MonthlyIncomeScreen.routeName);
                          //         Navigator.pushReplacementNamed(
                          //             context, MonthlyIncomeScreen.routeName);
                          //         if (!UserPreferences.instance.isVideoInit()) {
                          //           Navigator.of(context).push(
                          //               MaterialPageRoute(builder: (context) {
                          //             return VideoStoryScreen('first'.tr());
                          //           }));
                          //         }
                          //       }
                          //     },
                          //     child: Container(
                          //       // width: 70,
                          //       // height: 60,
                          //       // color: Colors.green,
                          //       padding: EdgeInsets.only(left: 20, right: 20),
                          //       // width: 70,
                          //       // height: 60,
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.end,
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           SizedBox(
                          //             child: Icon(
                          //               Icons.arrow_forward,
                          //               color: AppColors.MAIN_COLOR,
                          //               size: 30.0,
                          //             ),
                          //             // width: 29,
                          //             // height: 43,
                          //           ),
                          //           Text(
                          //             "Next".tr(),
                          //             style: TextStyle(
                          //                 color: AppColors.MAIN_COLOR,
                          //                 fontSize: 13,
                          //                 fontFamily: "Segoe UI",
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
    );
  }
}
