import 'dart:math' as math;

import 'package:bank_app_flutter/prefs/UserPreferences.dart';
import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/screens/cards/custom/reminder_custom_dialog.dart';
import 'package:bank_app_flutter/screens/custom_screen/calculate_screen.dart';
import 'package:bank_app_flutter/screens/custom_screen/custom_dropdown_textfeild.dart';
import 'package:bank_app_flutter/screens/salary/table_of_salary.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../home_screen.dart';
import 'custom/delete_custom_dialog.dart';

enum SelectedRow { yes, no }

class MonthlyIncomeScreen extends StatefulWidget {
  static final routeName = "monthlyIncomeScreen";

  @override
  _MonthlyIncomeScreenState createState() => _MonthlyIncomeScreenState();
}

class _MonthlyIncomeScreenState extends State<MonthlyIncomeScreen> {
  FocusNode myFocusNode;
  HomeProvider provider;
  SelectedRow _character = SelectedRow.yes;
  String result = "";
  List<TextEditingController> _textCont = [];
  List<TextFormField> _fields = [];
  ScrollController _scrollController = ScrollController();

  List expenses = [
    "ملابس",
    "صالون حلاقة",
    "مشغل نسائي",
    "مطاعم",
    "كوفي شوب",
    "مقاضي",
    "إيجار",
    "إنترنت",
    "كهرباء",
    "ماء",
    "فاتورة جوال",
    " مصروف المدرسة",
    "مستلزمات المدرسة",
    "بنزين",
    "زيت",
    "غسيل",
    "قطع غيار",
    "صيانة",
    "مخالفات",
    "اشتراك نادي",
    "ترفيه",
    "تاكسي",
    "1- بطاقة بنكية",
    "2- بطاقة بنكية",
    "3- بطاقة بنكية",
    "أخرى"
  ];

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    for (final controller in _textCont) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeProvider>(context);

    // for (final controller in _textCont) {
    //   controller.dispose();
    // }
    if (Provider.of<HomeProvider>(context).monthList == null) {
    } else {
      initialFileds();
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.Back_Ground_COLOR,
      appBar: AppBar(
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10),
            child: Text.rich(
              TextSpan(
                text:
                    'Divide the income by making a financial plan by the needs of the current month'
                        .tr(),
                style: TextStyle(fontSize: 15, color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: ' ',
                  ),
                  TextSpan(
                      text: 'and go to the next page'.tr(),
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  TextSpan(
                    text: ' ',
                  ),
                  TextSpan(
                      text:
                          'to record the daily expenses and know the remaining for each item'
                              .tr(),
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  // can add more TextSpans here...
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          preferredSize: Size(0.0, 25.0),
        ),
        // title: Center(
        //   child: FittedBox(
        //     fit: BoxFit.scaleDown,
        //     child: Text(
        //       "Divide the income by making a financial plan on the needs of the current month and go to the next page to record the daily expenses and know the remaining for each item"
        //           .tr(),
        //       style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 10,
        //           fontFamily: "Segoe UI",
        //           fontWeight: FontWeight.bold),
        //     ),
        //   ),
        // ),
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.arrow_forward),
        //     onPressed: () {
        //       //TODO: show yes no to add reminder amount to save amount
        //       provider.validateMonthlyIncome().then((v) {
        //         if (v is bool && v) {
        //           if (provider.getRemainingAmount() > 0) {
        //             showDialog(
        //                 context: context,
        //                 builder: (BuildContext context) {
        //                   return ReminderCustomDialog();
        //                 }).then((value) {
        //               if (value is bool && value) {
        //                 provider.monthList.saveAmount +=
        //                     provider.getRemainingAmount();
        //                 Provider.of<HomeProvider>(context, listen: false)
        //                     .saveList(isPlan: true);
        //                 UserPreferences.instance.saveRoutName(TableOfSaralyScreen.routeName);
        //                 Navigator.pushReplacementNamed(
        //                     context, TableOfSaralyScreen.routeName);
        //               }
        //               ;
        //             });
        //           } else {
        //             Provider.of<HomeProvider>(context, listen: false)
        //                 .saveList(isPlan: true);
        //             UserPreferences.instance
        //                 .saveRoutName(TableOfSaralyScreen.routeName);
        //             UserPreferences.instance.saveRoutName(TableOfSaralyScreen.routeName);
        //             Navigator.pushReplacementNamed(
        //                 context, TableOfSaralyScreen.routeName);
        //           }
        //         } else {
        //           var snackBar = SnackBar(
        //               backgroundColor: AppColors.Snack_Bar_COLOR,
        //               content: Text(
        //                 v,
        //                 textAlign: TextAlign.center,
        //                 style: TextStyle(
        //                     fontSize: 20,
        //                     color: Colors.white,
        //                     fontWeight: FontWeight.w500,
        //                     fontFamily: "Segoe UI"),
        //               ));
        //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //         }
        //       });
        //     },
        //   ),
        // ],
        // leading: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () {
        //       Navigator.pushReplacementNamed(
        //           context, HomeScreen.routeName);
        //       // Navigator.of(context).pushNamedAndRemoveUntil(
        //       //     HomeScreen.routeName,
        //       //     (route) => route.isCurrent &&
        //       //             route.settings.name == HomeScreen.routeName
        //       //         ? false
        //       //         : true);
        //       // Navigator.pop(context);
        //     }),
      ),
      body: (Provider.of<HomeProvider>(context).monthList == null)
          ? CircularProgressIndicator()
          : Consumer<HomeProvider>(builder: (context, provider, x) {
              return Container(
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 5,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 87,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.16),
                                    spreadRadius: 3,
                                    blurRadius: 6),
                              ],
                            ),
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 8, bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Enter your total monthly income".tr(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: "Segoe UI",
                                        color: Colors.black,
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CalculateScreen(
                                                  0,
                                                  "Salary".tr(),
                                                  provider
                                                      .monthList.salaryAmount,
                                                  0,
                                                  false);
                                            }).then((value) {
                                          // TODO: show error message if amount not correct
                                          if (value == null) {
                                          } else if (double.parse(value) <
                                              provider
                                                  .getSumSaveExpencesCashAmount()) {
                                            final snackBar = SnackBar(
                                                backgroundColor:
                                                    AppColors.Snack_Bar_COLOR,
                                                content: Text(
                                                  "Salary is not proportional to total expenses. Please either increase the salary or reduce the expenses"
                                                      .tr(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: "Segoe UI"),
                                                ));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          } else {
                                            provider.changeSalaryAmount(value);
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/addadd.png"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      height: 29,
                                      width: 93,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey.shade200,
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.MAIN_COLOR,
                                              spreadRadius: 1),
                                        ],
                                      ),
                                      child: Center(
                                        child: provider
                                                    .monthList.salaryAmount ==
                                                0
                                            ? Text("Enter the value + ".tr(),
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Tajawal',
                                                    color: Colors.red))
                                            : Text(
                                                NumberFormat('###,##0.00')
                                                    .format(provider.monthList
                                                        .salaryAmount),
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Segoe UI",
                                                  color: AppColors.Drawer_COLOR,
                                                ),
                                              ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "The remainder of the total monthly income"
                                            .tr(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "Segoe UI",
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 29,
                                      width: 93,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey.shade200,
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.MAIN_COLOR,
                                              spreadRadius: 1),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          NumberFormat('###,##0.00').format(
                                              provider.getRemainingAmount()),
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Segoe UI",
                                            color: AppColors.Drawer_COLOR,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Container(
                            height: 1.0,
                            color: AppColors.Border_COLOR,
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),

                          /// add
                          /// delete
                          /// zero
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     /// add expense ///
                          //     // Column(
                          //     //   mainAxisAlignment: MainAxisAlignment.center,
                          //     //   children: [
                          //     //     GestureDetector(
                          //     //       onTap: () async {
                          //     //         await provider.addExpense();
                          //     //         var scrollPosition = _scrollController.position;
                          //     //         _scrollController.animateTo(
                          //     //           scrollPosition.maxScrollExtent + 60,
                          //     //           duration: new Duration(milliseconds: 200),
                          //     //           curve: Curves.easeOut,
                          //     //         );
                          //     //       },
                          //     //       child: Container(
                          //     //         width:
                          //     //             (MediaQuery.of(context).size.width - 32) /
                          //     //                 3,
                          //     //         height: 24,
                          //     //         decoration: BoxDecoration(
                          //     //           color: Colors.white,
                          //     //           boxShadow: [
                          //     //             BoxShadow(
                          //     //                 color: AppColors.MAIN_COLOR,
                          //     //                 spreadRadius: 1),
                          //     //           ],
                          //     //           image: DecorationImage(
                          //     //             image: AssetImage("assets/images/Plus.png"),
                          //     //           ),
                          //     //         ),
                          //     //       ),
                          //     //     ),
                          //     //     SizedBox(
                          //     //       height: 4,
                          //     //     ),
                          //     //     Text(
                          //     //       "Add expense".tr(),
                          //     //       style: TextStyle(
                          //     //         fontSize: 13,
                          //     //         fontWeight: FontWeight.w600,
                          //     //         fontFamily: "Segoe UI",
                          //     //       ),
                          //     //     ),
                          //     //   ],
                          //     // ),
                          //     /// zero expense ///
                          //     // Column(
                          //     //   mainAxisAlignment: MainAxisAlignment.center,
                          //     //   children: [
                          //     //     GestureDetector(
                          //     //       onTap: () {
                          //     //         provider.resetValues();
                          //     //       },
                          //     //       child: Container(
                          //     //         width:
                          //     //             (MediaQuery.of(context).size.width - 32) /
                          //     //                 3,
                          //     //         height: 24,
                          //     //         decoration: BoxDecoration(
                          //     //           color: Colors.white,
                          //     //           boxShadow: [
                          //     //             BoxShadow(
                          //     //                 color: AppColors.MAIN_COLOR,
                          //     //                 spreadRadius: 1),
                          //     //           ],
                          //     //           image: DecorationImage(
                          //     //             image: AssetImage("assets/images/loop.png"),
                          //     //           ),
                          //     //         ),
                          //     //       ),
                          //     //     ),
                          //     //     SizedBox(
                          //     //       height: 4,
                          //     //     ),
                          //     //     Text(
                          //     //       "Zero values".tr(),
                          //     //       style: TextStyle(
                          //     //         fontSize: 13,
                          //     //         fontWeight: FontWeight.w600,
                          //     //         fontFamily: "Segoe UI",
                          //     //       ),
                          //     //     ),
                          //     //   ],
                          //     // ),
                          //     /// delete expense ///
                          //     // Column(
                          //     //   mainAxisAlignment: MainAxisAlignment.center,
                          //     //   children: [
                          //     //     GestureDetector(
                          //     //       onTap: () {
                          //     //         provider.changeDeleteEnable();
                          //     //       },
                          //     //       child: Container(
                          //     //         width:
                          //     //             (MediaQuery.of(context).size.width - 32) /
                          //     //                 3,
                          //     //         height: 24,
                          //     //         decoration: BoxDecoration(
                          //     //           // borderRadius: BorderRadius.only(
                          //     //           //     topLeft: Radius.circular(5),
                          //     //           //     bottomLeft: Radius.circular(5)),
                          //     //           color: Colors.white,
                          //     //           boxShadow: [
                          //     //             BoxShadow(
                          //     //                 color: AppColors.MAIN_COLOR,
                          //     //                 spreadRadius: 1),
                          //     //           ],
                          //     //           image: DecorationImage(
                          //     //             image:
                          //     //                 AssetImage("assets/images/close.png"),
                          //     //           ),
                          //     //         ),
                          //     //       ),
                          //     //     ),
                          //     //     SizedBox(
                          //     //       height: 4,
                          //     //     ),
                          //     //     Text(
                          //     //       "Delete expense".tr(),
                          //     //       style: TextStyle(
                          //     //         fontSize: 13,
                          //     //         fontWeight: FontWeight.w600,
                          //     //         fontFamily: "Segoe UI",
                          //     //       ),
                          //     //     ),
                          //     //   ],
                          //     // ),
                          //   ],
                          // ),
                          SizedBox(
                            height: 3,
                          ),

                          /// devider ///
                          // Container(
                          //   height: 1.0,
                          //   color: AppColors.Border_COLOR,
                          // ),
                          // SizedBox(
                          //   // height: 26,
                          //   height: 5,
                          // ),
                          Container(
                            // padding: EdgeInsets.only(top: 7),
                            child: Column(
                              children: [
                                // SizedBox(
                                //   height: 7,
                                // ),
                                Text(
                                  "Monthly saver".tr(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Segoe UI",
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  // height: 13,
                                  height: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.Border_COLOR),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                  ),
                                  child: Table(
                                    columnWidths: {
                                      0: FlexColumnWidth(1),
                                      1: FlexColumnWidth(4),
                                      2: FlexColumnWidth(4),
                                    },
                                    border: TableBorder(
                                      horizontalInside: BorderSide(
                                          width: 1,
                                          color: AppColors.Border_COLOR,
                                          style: BorderStyle.solid),
                                      verticalInside: BorderSide(
                                          width: 1,
                                          color: AppColors.Border_COLOR,
                                          style: BorderStyle.solid),
                                    ),

                                    // border:
                                    //     TableBorder.all(color: AppColors.Border_COLOR),
                                    children: [
                                      TableRow(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          color: AppColors.BG_Table_COLOR,
                                        ),
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            // decoration: BoxDecoration(
                                            //   borderRadius: BorderRadius.only(
                                            //       topRight: Radius.circular(10)),
                                            //   border: Border.all(
                                            //       color: AppColors.Border_COLOR),
                                            //   color: AppColors.MAIN_COLOR,
                                            // ),
                                            child: Center(
                                              child: Text(
                                                "NO".tr(),
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Tajawal',
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            // decoration: BoxDecoration(
                                            //   border: Border.all(
                                            //       color: AppColors.Border_COLOR),
                                            //   color: AppColors.MAIN_COLOR,
                                            // ),
                                            child: Center(
                                              child: Text(
                                                "Saver".tr(),
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Tajawal',
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: SizedBox(
                                              // decoration: BoxDecoration(
                                              //   borderRadius: BorderRadius.only(
                                              //       topLeft: Radius.circular(10)),
                                              //   border: Border.all(
                                              //       color: AppColors.Border_COLOR),
                                              //   color: AppColors.MAIN_COLOR,
                                              // ),
                                              // padding: EdgeInsets.only(top: 10),
                                              height: 40,
                                              child: Center(
                                                child: Text(
                                                  "Enter the savings amount"
                                                      .tr(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Tajawal',
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                          color: AppColors.bg_COLOR,
                                        ),
                                        children: [
                                          TableCell(
                                            child: SizedBox(
                                              height: 40,
                                              // decoration: BoxDecoration(
                                              //   borderRadius: BorderRadius.only(
                                              //       bottomRight: Radius.circular(10)),
                                              //   color: AppColors.No_Table_COLOR,
                                              // ),
                                              // width:
                                              //     MediaQuery.of(context).size.width,
                                              child: Center(
                                                child: Text(
                                                  "1",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Tajawal',
                                                      color: AppColors
                                                          .Text_Table_COLOR),
                                                ),
                                              ),
                                            ),
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                "Saver".tr(),
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Tajawal',
                                                    color: AppColors
                                                        .Text_Table_COLOR),
                                              ),
                                            ),
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                          ),
                                          TableCell(
                                            child: GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return CalculateScreen(
                                                          0,
                                                          "Saver".tr(),
                                                          provider.getRemainingAmount() +
                                                              provider.monthList
                                                                  .saveAmount,
                                                          provider.getRemainingAmount() +
                                                              provider.monthList
                                                                  .saveAmount -
                                                              provider
                                                                  .getRemainingAmount() +
                                                              provider.monthList
                                                                  .totalSave,
                                                          false);
                                                    }).then((value) {
                                                  // TODO: show error message if amount not correct
                                                  if (value == null) {
                                                  } else if (double.parse(
                                                          value) >
                                                      (provider
                                                              .getRemainingAmount() +
                                                          provider.monthList
                                                              .saveAmount)) {
                                                    final snackBar = SnackBar(
                                                        backgroundColor:
                                                            AppColors
                                                                .Snack_Bar_COLOR,
                                                        content: Text(
                                                          'Salary is not proportional to total expenses. Please either increase the salary or reduce the expenses'
                                                              .tr(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  "Segoe UI"),
                                                        ));
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  } else {
                                                    provider.changeSaveAmount(
                                                        value);
                                                  }
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10)),
                                                ),
                                                child: Center(
                                                  child: provider.monthList
                                                              .saveAmount ==
                                                          0
                                                      ? Text(
                                                          "Enter the value + "
                                                              .tr(),
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  'Tajawal',
                                                              color:
                                                                  Colors.red))
                                                      : Text(
                                                          NumberFormat(
                                                                  '###,##0.00')
                                                              .format(provider
                                                                  .monthList
                                                                  .saveAmount),
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "Segoe UI",
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                ),
                                              ),
                                            ),
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      // height: 27,
                      height: 10,
                    ),
                    Container(
                      height: 1.0,
                      color: AppColors.Divider_COLOR,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, top: 4, right: 16),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "Monthly financial plan".tr(),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                fontFamily: "Segoe UI",
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(children: [
                            // GestureDetector(
                            //     child: Container(
                            //       decoration: BoxDecoration(
                            //         // border: Border.all(),
                            //         borderRadius: BorderRadius.only(
                            //           bottomRight: Radius.circular(0),
                            //         ),
                            //         color: AppColors.Back_Ground_COLOR,
                            //         image: DecorationImage(
                            //           image: AssetImage(
                            //               "assets/images/delete_black.png"),
                            //         ),
                            //       ),
                            //       width: MediaQuery.of(context).size.width / 10,
                            //       height: 40,
                            //     ),
                            //     onTap: () {
                            //       showDialog(
                            //           context: context,
                            //           builder: (BuildContext context) {
                            //             return DeleteCustomDialog();
                            //           }).then((value) async {
                            //         if (value is bool && value) {
                            //           provider.changeDeleteEnable();
                            //
                            //           await provider.removeExpense();
                            //           initialFileds();
                            //         }
                            //         ;
                            //       });
                            //     }),
                            Expanded(
                              child: Table(
                                border: TableBorder(
                                  horizontalInside: BorderSide(
                                      width: 1,
                                      color: AppColors.Border_COLOR,
                                      style: BorderStyle.solid),
                                  verticalInside: BorderSide(
                                      width: 1,
                                      color: AppColors.Border_COLOR,
                                      style: BorderStyle.solid),
                                ),
                                columnWidths: {
                                  0: FlexColumnWidth(1),
                                  1: FlexColumnWidth(4),
                                  2: FlexColumnWidth(4),
                                },
                                children: [
                                  TableRow(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        color: AppColors.BG_Table_COLOR,
                                      ),
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          // decoration: BoxDecoration(
                                          //   border: Border.all(
                                          //       color: AppColors.Border_COLOR),
                                          //   borderRadius: BorderRadius.only(
                                          //     topRight: Radius.circular(10),
                                          //   ),
                                          //   color: AppColors.MAIN_COLOR,
                                          // ),
                                          child: Center(
                                            child: Text(
                                              "NO".tr(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'Tajawal',
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                          // decoration: BoxDecoration(
                                          //   border: Border.all(
                                          //       color: AppColors.Border_COLOR),
                                          //   color: AppColors.MAIN_COLOR,
                                          // ),
                                          child: Center(
                                            child: Text(
                                              "Item name".tr(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Tajawal',
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                          // decoration: BoxDecoration(
                                          //   border: Border.all(
                                          //       color: AppColors.Border_COLOR),
                                          //   borderRadius: BorderRadius.only(
                                          //       topLeft: Radius.circular(10)),
                                          //   color: AppColors.MAIN_COLOR,
                                          // ),
                                          // padding: EdgeInsets.only(top: 3),
                                          child: Center(
                                            child: Text(
                                              // "أدخل قيم الجدولة \n للمصاريف الشهرية",
                                              "Enter item values".tr(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Tajawal',
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                            Column(children: [
                              SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width / 20,
                                child: Center(
                                  child: Container(),
                                ),
                              ),
                            ]),
                          ])
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _scrollController = ScrollController(),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 16, top: 4),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Table(
                                            border: TableBorder(
                                              top: BorderSide(
                                                color: AppColors.Border_COLOR,
                                              ),
                                              right: BorderSide(
                                                color: AppColors.Border_COLOR,
                                              ),
                                              bottom: BorderSide(
                                                color: AppColors.Border_COLOR,
                                              ),
                                              left: BorderSide(
                                                color: AppColors.Border_COLOR,
                                              ),
                                              horizontalInside: BorderSide(
                                                color: AppColors.Border_COLOR,
                                              ),
                                              verticalInside: BorderSide(
                                                color: AppColors.Border_COLOR,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                              ),
                                            ),
                                            columnWidths: {
                                              0: FlexColumnWidth(1),
                                              1: FlexColumnWidth(4),
                                              2: FlexColumnWidth(4),
                                            },
                                            children: [
                                              for (int i = 0;
                                                  i <
                                                      provider.monthList
                                                          .expences.length;
                                                  i++)
                                                TableRow(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomRight: Radius.circular(i <
                                                              provider
                                                                      .monthList
                                                                      .expences
                                                                      .length -
                                                                  1
                                                          ? 0
                                                          : 10),
                                                      bottomLeft: Radius.circular(i <
                                                              provider
                                                                      .monthList
                                                                      .expences
                                                                      .length -
                                                                  1
                                                          ? 0
                                                          : 10),
                                                    ),
                                                    color: i % 2 == 0
                                                        ? AppColors.bg1_COLOR
                                                        : AppColors.bg_COLOR,
                                                  ),
                                                  children: [
                                                    SizedBox(
                                                      // decoration: BoxDecoration(
                                                      //   border: Border.all(
                                                      //       color: AppColors
                                                      //           .Border_COLOR),
                                                      //   borderRadius:
                                                      //       BorderRadius.only(
                                                      //     bottomRight: Radius.circular(i <
                                                      //             provider
                                                      //                     .monthList
                                                      //                     .expences
                                                      //                     .length -
                                                      //                 1
                                                      //         ? 0
                                                      //         : 10),
                                                      //   ),
                                                      //   color:
                                                      //       AppColors.No_Table_COLOR,
                                                      // ),
                                                      // width: MediaQuery.of(context)
                                                      //     .size
                                                      //     .width,
                                                      height: 40,
                                                      child: Center(
                                                        child: Text(
                                                          (i + 1).toString(),
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  'Tajawal',
                                                              color: AppColors
                                                                  .Text_Table_COLOR),
                                                        ),
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //
                                                    //   height: 40,
                                                    //   // decoration: BoxDecoration(
                                                    //   //   // border: Border.all(
                                                    //   //   //     color: AppColors
                                                    //   //   //         .Border_COLOR),
                                                    //   //   color:
                                                    //   //       AppColors.App_Bar_COLOR,
                                                    //   // ),
                                                    //   child: Center(
                                                    //       child: _fields[i]
                                                    //   ),
                                                    // ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Navigator.pushNamed(
                                                        //         context,
                                                        //         NameExpensesCustomScreen
                                                        //             .routeName)
                                                        //     .then((value) {
                                                        //   if (value == null) {
                                                        //   } else
                                                        //     provider
                                                        //         .changeExpensesType(
                                                        //             value, i);
                                                        // });
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              provider.tresutl =
                                                                  provider
                                                                      .monthList
                                                                      .expences[
                                                                          i]
                                                                      .type;
                                                              return CustomDropdownTextfeildScreen();
                                                              //NameExpensesCustom();
                                                            }).then((value) {
                                                          // TODO: show error message if amount not correct
                                                          if (value == null) {
                                                          } else
                                                            provider
                                                                .changeExpensesType(
                                                                    value, i);
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            (provider
                                                                            .monthList
                                                                            .expences[
                                                                                i]
                                                                            .type ==
                                                                        null ||
                                                                    provider
                                                                            .monthList
                                                                            .expences[
                                                                                i]
                                                                            .type ==
                                                                        "")
                                                                ? "Enter the item name"
                                                                    .tr()
                                                                : provider
                                                                    .monthList
                                                                    .expences[i]
                                                                    .type,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Tajawal',
                                                                color: (provider.monthList.expences[i].type ==
                                                                            null ||
                                                                        provider.monthList.expences[i].type ==
                                                                            "")
                                                                    ? Colors.red
                                                                    : AppColors
                                                                        .Text_Table_COLOR),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 40,
                                                      // decoration: BoxDecoration(
                                                      //   borderRadius:
                                                      //       BorderRadius.only(
                                                      //     bottomLeft: Radius.circular(i <
                                                      //             provider
                                                      //                     .monthList
                                                      //                     .expences
                                                      //                     .length -
                                                      //                 1
                                                      //         ? 0
                                                      //         : 10),
                                                      //   ),
                                                      //   border: Border.all(
                                                      //       color: AppColors
                                                      //           .Border_COLOR),
                                                      //   color:
                                                      //       AppColors.App_Bar_COLOR,
                                                      // ),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return CalculateScreen(
                                                                    (i + 1),
                                                                    provider
                                                                        .monthList
                                                                        .expences[
                                                                            i]
                                                                        .type,
                                                                    provider
                                                                        .monthList
                                                                        .expences[
                                                                            i]
                                                                        .amount,
                                                                    provider
                                                                            .monthList
                                                                            .expences[
                                                                                i]
                                                                            .amount -
                                                                        provider
                                                                            .monthList
                                                                            .expences[i]
                                                                            .total,
                                                                    false);
                                                              }).then((value) {
                                                            // TODO: show error message if amount not correct
                                                            if (value == null) {
                                                            } else if (double
                                                                    .parse(
                                                                        value) >
                                                                (provider
                                                                        .getRemainingAmount() +
                                                                    provider
                                                                        .monthList
                                                                        .expences[
                                                                            i]
                                                                        .amount)) {
                                                              final snackBar =
                                                                  SnackBar(
                                                                      backgroundColor:
                                                                          AppColors
                                                                              .Snack_Bar_COLOR,
                                                                      content:
                                                                          Text(
                                                                        'Salary is not proportional to total expenses. Please either increase the salary or reduce the expenses'
                                                                            .tr(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w500,
                                                                            fontFamily: "Segoe UI"),
                                                                      ));
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      snackBar);
                                                            } else {
                                                              provider
                                                                  .changeExpensesAmount(
                                                                      value, i);
                                                            }
                                                          });
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            10)),
                                                          ),
                                                          child: Center(
                                                            child: provider
                                                                        .monthList
                                                                        .expences[
                                                                            i]
                                                                        .amount ==
                                                                    0
                                                                ? Text("Enter the value + ".tr(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontFamily:
                                                                            'Tajawal',
                                                                        color: Colors
                                                                            .red))
                                                                : Text(
                                                                    //"أدخل القيم +",
                                                                    NumberFormat('###,##0.00').format(provider
                                                                        .monthList
                                                                        .expences[
                                                                            i]
                                                                        .amount),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Tajawal',
                                                                      // color: provider.monthList.expences[i].amount == null ? Colors.red : Colors.black,

                                                                      color: AppColors
                                                                          .Text_Table_COLOR,
                                                                    ),
                                                                  ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                        Column(children: [
                                          for (int i = 0;
                                              i <
                                                  provider.monthList.expences
                                                      .length;
                                              i++)
                                            SizedBox(
                                              height: 40,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20,

                                              /// close ///
                                              // GestureDetector(
                                              //                                                     //   onTap: () {
                                              //                                                     //    if(provider.monthList
                                              //                                                     //        .expences[i].isSelect){
                                              //                                                     //      provider
                                              //                                                     //          .monthList
                                              //                                                     //          .expences[i]
                                              //                                                     //          .isSelect =
                                              //                                                     //      !provider
                                              //                                                     //          .monthList
                                              //                                                     //          .expences[i]
                                              //                                                     //          .isSelect;
                                              //                                                     //      provider.printList();
                                              //                                                     //      provider
                                              //                                                     //          .notifyListeners();
                                              //                                                     //      showDialog(
                                              //                                                     //          context: context,
                                              //                                                     //          builder:
                                              //                                                     //              (BuildContext
                                              //                                                     //          context) {
                                              //                                                     //            return DeleteCustomDialog();
                                              //                                                     //          }).then((value) async {
                                              //                                                     //        if (value is bool &&
                                              //                                                     //            value) {
                                              //                                                     //          provider
                                              //                                                     //              .changeDeleteEnable();
                                              //                                                     //
                                              //                                                     //          await provider
                                              //                                                     //              .removeExpense();
                                              //                                                     //          initialFileds();
                                              //                                                     //        }
                                              //                                                     //        ;
                                              //                                                     //      });
                                              //                                                     //    }
                                              //                                                     //   },
                                              //                                                     //   child: Image(
                                              //                                                     //     image: AssetImage(
                                              //                                                     //         "assets/images/close.png"),
                                              //                                                     //   ),
                                              //                                                     // ),
                                              child: Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return DeleteCustomDialog();
                                                        }).then((value) async {
                                                      if (value is bool &&
                                                          value) {
                                                        provider
                                                            .monthList
                                                            .expences[i]
                                                            .isSelect = true;
                                                        await provider
                                                            .removeExpense();
                                                        initialFileds();
                                                      }
                                                    });
                                                  },
                                                  child:
                                                      // Icon(
                                                      //   Icons.cancel_outlined,
                                                      //   color: Colors.red,
                                                      //    // size: 10,
                                                      // ),
                                                      Image(
                                                    image: AssetImage(
                                                        "assets/images/close.png"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ]),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    // Container(
                    //   height: 1.0,
                    //   color: AppColors.Divider_COLOR,
                    // ),
                    // Container(
                    //   padding: EdgeInsets.only(left: 16, right: 16),
                    //   child: Column(
                    //     children: [
                    //       SizedBox(
                    //         height: 2,
                    //       ),
                    //       Text(
                    //         "Monthly cash amount".tr(),
                    //         style: TextStyle(
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.w900,
                    //           fontFamily: "Segoe UI",
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         // height: 13,
                    //         height: 5,
                    //       ),
                    //       Container(
                    //         decoration: BoxDecoration(
                    //           border: Border.all(color: AppColors.Border_COLOR),
                    //           borderRadius: BorderRadius.only(
                    //               topLeft: Radius.circular(10),
                    //               topRight: Radius.circular(10),
                    //               bottomRight: Radius.circular(10),
                    //               bottomLeft: Radius.circular(10)),
                    //         ),
                    //         child: Table(
                    //           columnWidths: {
                    //             0: FlexColumnWidth(1),
                    //             1: FlexColumnWidth(4),
                    //             2: FlexColumnWidth(4),
                    //           },
                    //           border: TableBorder(
                    //             horizontalInside: BorderSide(
                    //                 width: 1,
                    //                 color: AppColors.Border_COLOR,
                    //                 style: BorderStyle.solid),
                    //             verticalInside: BorderSide(
                    //                 width: 1,
                    //                 color: AppColors.Border_COLOR,
                    //                 style: BorderStyle.solid),
                    //           ),
                    //
                    //           // border:
                    //           //     TableBorder.all(color: AppColors.Border_COLOR),
                    //           children: [
                    //             TableRow(
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.only(
                    //                   topLeft: Radius.circular(10),
                    //                   topRight: Radius.circular(10),
                    //                 ),
                    //                 color: AppColors.BG_Table_COLOR,
                    //               ),
                    //               children: [
                    //                 SizedBox(
                    //                   height: 40,
                    //                   child: Center(
                    //                     child: Text(
                    //                       "NO".tr(),
                    //                       style: TextStyle(
                    //                           fontSize: 13,
                    //                           fontFamily: 'Tajawal',
                    //                           fontWeight: FontWeight.w500,
                    //                           color: Colors.white),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 SizedBox(
                    //                   height: 40,
                    //                   child: Center(
                    //                     child: Text(
                    //                       "Cash amount".tr(),
                    //                       style: TextStyle(
                    //                           fontSize: 13,
                    //                           fontWeight: FontWeight.w500,
                    //                           fontFamily: 'Tajawal',
                    //                           color: Colors.white),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 TableCell(
                    //                   child: SizedBox(
                    //                     height: 40,
                    //                     child: Row(
                    //                       mainAxisAlignment: MainAxisAlignment.center,
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.center,
                    //                       children: [
                    //                         Column(
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment.start,
                    //                           children: [
                    //                             Padding(
                    //                               padding: EdgeInsets.only(top: 10),
                    //                             ),
                    //                             StarRedCustom(
                    //                               isHidden: true,
                    //                             ),
                    //                           ],
                    //                         ),
                    //                         SizedBox(
                    //                           width: 2,
                    //                         ),
                    //                         Column(
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment.start,
                    //                           children: [
                    //                             Padding(
                    //                               padding: EdgeInsets.only(top: 10),
                    //                             ),
                    //                             Expanded(
                    //                               child: Text(
                    //                                 "Enter the cash amount".tr(),
                    //                                 textAlign: TextAlign.center,
                    //                                 style: TextStyle(
                    //                                     fontSize: 13,
                    //                                     fontWeight: FontWeight.w500,
                    //                                     fontFamily: 'Tajawal',
                    //                                     color: Colors.white),
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             TableRow(
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.only(
                    //                     bottomRight: Radius.circular(10),
                    //                     bottomLeft: Radius.circular(10)),
                    //                 color: AppColors.bg_COLOR,
                    //               ),
                    //               children: [
                    //                 TableCell(
                    //                   child: SizedBox(
                    //                     height: 40,
                    //                     child: Center(
                    //                       child: Text(
                    //                         "1",
                    //                         style: TextStyle(
                    //                             fontSize: 13,
                    //                             fontWeight: FontWeight.w500,
                    //                             fontFamily: 'Tajawal',
                    //                             color: AppColors.Text_Table_COLOR),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   verticalAlignment:
                    //                       TableCellVerticalAlignment.middle,
                    //                 ),
                    //                 TableCell(
                    //                   child: Center(
                    //                     child: Text(
                    //                       "The amount".tr(),
                    //                       style: TextStyle(
                    //                           fontSize: 13,
                    //                           fontWeight: FontWeight.w500,
                    //                           fontFamily: 'Tajawal',
                    //                           color: AppColors.Text_Table_COLOR),
                    //                     ),
                    //                   ),
                    //                   verticalAlignment:
                    //                       TableCellVerticalAlignment.middle,
                    //                 ),
                    //                 TableCell(
                    //                   child: GestureDetector(
                    //                     onTap: () {
                    //                       showDialog(
                    //                           context: context,
                    //                           builder: (BuildContext context) {
                    //                             return CalculateScreen();
                    //                           }).then((value) {
                    //                         // TODO: show error message if amount not correct
                    //                         if (value == null) {
                    //                         } else if (double.parse(value) >
                    //                             (provider.getRemainingAmount() +
                    //                                 provider.monthList.cashAmount)) {
                    //                           final snackBar = SnackBar(
                    //                               backgroundColor:
                    //                                   AppColors.Snack_Bar_COLOR,
                    //                               content: Text(
                    //                                 'Salary is not proportional to total expenses. Please either increase the salary or reduce the expenses'
                    //                                     .tr(),
                    //                                 textAlign: TextAlign.center,
                    //                                 style: TextStyle(
                    //                                     fontSize: 20,
                    //                                     color: Colors.white,
                    //                                     fontWeight: FontWeight.w500,
                    //                                     fontFamily: "Segoe UI"),
                    //                               ));
                    //                           ScaffoldMessenger.of(context)
                    //                               .showSnackBar(snackBar);
                    //                         } else {
                    //                           provider.changeCashAmount(value);
                    //                         }
                    //                       });
                    //                     },
                    //                     child: Container(
                    //                       decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.only(
                    //                             bottomLeft: Radius.circular(10)),
                    //                       ),
                    //                       child: Center(
                    //                         child: Text(
                    //                           NumberFormat('###,##0.00').format(
                    //                               provider.monthList.cashAmount),
                    //                           style: TextStyle(
                    //                             fontSize: 13,
                    //                             fontWeight: FontWeight.w400,
                    //                             fontFamily: "Segoe UI",
                    //                             color: Colors.black,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   verticalAlignment:
                    //                       TableCellVerticalAlignment.middle,
                    //                 ),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    /// back /// previous
                    SizedBox(
                      // height: 27,
                      height: 5,
                    ),
                    Container(
                      height: 1.0,
                      color: AppColors.Divider_COLOR,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: 16, right: 16),
                      height: 75,
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
                                // color: Colors.green,
                                margin: EdgeInsets.only(right: 20, left: 20),
                                // width: 70,
                                // height: 60,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      // width: 29,
                                      // height: 43,
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: AppColors.MAIN_COLOR,
                                        size: 30.0,
                                      ),
                                    ),
                                    // SizedBox(height: 5,),
                                    Text(
                                      "Previous".tr(),
                                      style: TextStyle(
                                          color: AppColors.MAIN_COLOR,
                                          fontSize: 13,
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
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
                                      color: AppColors.MAIN_COLOR,
                                    ),
                                    child: IconButton(
                                      onPressed: () async {
                                        await provider.addExpense();
                                        var scrollPosition =
                                            _scrollController.position;
                                        _scrollController.animateTo(
                                          scrollPosition.maxScrollExtent + 60,
                                          duration:
                                              new Duration(milliseconds: 200),
                                          curve: Curves.easeOut,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Add Item".tr(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.MAIN_COLOR,
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
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                provider.validateMonthlyIncome().then((v) {
                                  if (v is bool && v) {
                                    if (provider.getRemainingAmount() > 0) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ReminderCustomDialog();
                                          }).then((value) {
                                        if (value is bool && value) {
                                          provider.monthList.saveAmount +=
                                              provider.getRemainingAmount();
                                          Provider.of<HomeProvider>(context,
                                                  listen: false)
                                              .saveList(isPlan: true);
                                          UserPreferences.instance.saveRoutName(
                                              TableOfSaralyScreen.routeName);
                                          Navigator.pushReplacementNamed(
                                              context,
                                              TableOfSaralyScreen.routeName);
                                        }
                                        ;
                                      });
                                    } else {
                                      Provider.of<HomeProvider>(context,
                                              listen: false)
                                          .saveList(isPlan: true);
                                      UserPreferences.instance.saveRoutName(
                                          TableOfSaralyScreen.routeName);
                                      UserPreferences.instance.saveRoutName(
                                          TableOfSaralyScreen.routeName);
                                      Navigator.pushReplacementNamed(context,
                                          TableOfSaralyScreen.routeName);
                                    }
                                  } else {
                                    var snackBar = SnackBar(
                                        backgroundColor:
                                            AppColors.Snack_Bar_COLOR,
                                        content: Text(
                                          v,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Segoe UI"),
                                        ));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                });
                              },
                              child: Container(
                                // width: 70,
                                // height: 60,
                                // color: Colors.green,
                                margin: EdgeInsets.only(left: 20, right: 20),
                                // width: 70,
                                // height: 60,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.MAIN_COLOR,
                                        size: 30.0,
                                      ),
                                      // width: 29,
                                      // height: 43,
                                    ),
                                    Text(
                                      "Next".tr(),
                                      style: TextStyle(
                                          color: AppColors.MAIN_COLOR,
                                          fontSize: 13,
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedB
                  ],
                ),
              );
            }),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 6.0),
      //   child: FloatingActionButton(
      //     onPressed: () async {
      //       await provider.addExpense();
      //       var scrollPosition = _scrollController.position;
      //       _scrollController.animateTo(
      //         scrollPosition.maxScrollExtent + 60,
      //         duration: new Duration(milliseconds: 200),
      //         curve: Curves.easeOut,
      //       );
      //     },
      //     backgroundColor: AppColors.MAIN_COLOR,
      //     child: Icon(
      //       Icons.add,
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void initialFileds() {
    List<TextEditingController> _newtextCont = [];
    List<TextFormField> _newfields = [];
    provider.monthList.expences.forEach((element) {
      TextEditingController controller = new TextEditingController();
      final field = TextFormField(
        maxLength: 15,
        controller: controller,
        onTap: () {
          // var scrollPosition = _scrollController.position;
          // _scrollController.animateTo(
          //   - scrollPosition.minScrollExtent,
          //   duration: new Duration(milliseconds: 200),
          //   curve: Curves.easeOut,
          // );
        },
        // maxLines: null,
        // initialValue: element.type,
        onChanged: (text) {
          element.type = text;
        },
        // focusNode: myFocusNode,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: "",
          contentPadding: EdgeInsets.zero,
          enabledBorder: InputBorder.none,
          hintText: "The expense".tr(),
          hintStyle: TextStyle(color: Colors.redAccent),
          labelStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'Tajawal',
            color: AppColors.Text_Table_COLOR,
          ),
        ),
      );
      controller.text = element.type;

      setState(() {
        _newtextCont.add(controller);
        _newfields.add(field);
      });
      _textCont = _newtextCont;
      _fields = _newfields;
    });
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
