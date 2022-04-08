import 'package:bank_app_flutter/screens/custom_screen/calculate_screen.dart';
import 'package:bank_app_flutter/screens/custom_screen/star_red_custom.dart';
import 'package:bank_app_flutter/screens/salary/drawer/app_drawer.dart';
import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
// import 'package:timer_snackbar/timer_snackbar.dart';

class TableOfSaralyScreen extends StatefulWidget {
  static final routeName = "tableOfSaralyScreen";

  @override
  _TableOfSaralyScreenState createState() => _TableOfSaralyScreenState();
}

class _TableOfSaralyScreenState extends State<TableOfSaralyScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List months = [
    "0",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "Septemper",
    "October",
    "November",
    "December",
  ];

  @override
  Widget build(BuildContext context) {
    //the birthday's date
    // DateTime sallaryDate = Provider.of<HomeProvider>(context).monthList.sallaryDate;
    // sallaryDate = sallaryDate == null ? DateTime.now() : sallaryDate;
    // final date2 = DateTime.now();
    // final difference = daysBetween(DateTime.now(), DateTime.now());
return Scaffold(
      backgroundColor: AppColors.Back_Ground_COLOR,
      key: _scaffoldKey,
      //appBar:
      // AppBar(
      //
      //   elevation: 0,
      //   // title: Text(
      //   //   "جدول راتبك",
      //   //   textAlign: TextAlign.start,
      //   //   style: TextStyle(
      //   //     fontWeight: FontWeight.w900,
      //   //     fontSize: 17,
      //   //     color: Colors.black,
      //   //   ),
      //   // ),
      //   backgroundColor: AppColors.MAIN_COLOR,
      //   // leading: SizedBox(
      //   //   height: 25,
      //   //   width: 25,
      //   //   child: IconButton(
      //   //     icon: Image.asset('assets/images/settings_white.png'),
      //   //     onPressed: () {
      //   //       openEndDrawer();
      //   //     },
      //   //   ),
      //   // ),
      //
      // ),
      drawer: DrawerScreen(),
      body: (Provider.of<HomeProvider>(context).monthList == null) ?
    CircularProgressIndicator()
    : Consumer<HomeProvider>(builder: (context, provider, x) {
        return Container(
          child: Column(
            children: [
              Container(color: AppColors.MAIN_COLOR,
                height: 54,),
              Directionality(
                textDirection: ui.TextDirection.rtl,
                child: Container(
                    padding: EdgeInsets.only(right: 16, left: 10),
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.MAIN_COLOR,
                    height: 60,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Center(
                                        child: Text(
                                          "Remaining on the month paycheck "
                                              .tr(args: [
                                            months[(DateTime.parse(Provider
                                                            .of<HomeProvider>(
                                                                context,
                                                                listen: true)
                                                        .monthList
                                                        .salaryDate))
                                                    .month]
                                                .toString()
                                                .tr()
                                          ]),

                                          //   "Remaining on the".tr() + " " + months[DateTime.now().month].toString() + " paycheck " .tr(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Segoe UI",
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.Border_COLOR,
                                            spreadRadius: 1),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          Provider.of<HomeProvider>(context,
                                                      listen: false)
                                                  .getReminderDate() +
                                              " " +
                                              "Day".tr(),
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Segoe UI",
                                            color: AppColors.Drawer_COLOR,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/settings_white.png',
                              color: Colors.white,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              openEndDrawer();
                            },
                          ),
                        ),
                      ],
                    )),
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 16, right: 16, top: 11),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Row(
              //             children: [
              //               Text(
              //                 "المتبقي على نزول راتب شهر ",
              //                 style: TextStyle(
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w900,
              //                   fontFamily: "Segoe UI",
              //                   color: Colors.black,
              //                 ),
              //               ),
              //               Text(
              //                 months[DateTime.now().month].toString(),
              //                 style: TextStyle(
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w900,
              //                   fontFamily: "Segoe UI",
              //                   color: Colors.black,
              //                 ),
              //               ),
              //               Spacer(),
              //               Container(
              //                 height: 20,
              //                 width: 55,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(5),
              //                   color: Colors.white,
              //                   boxShadow: [
              //                     BoxShadow(
              //                         color: AppColors.MAIN_COLOR,
              //                         spreadRadius: 1),
              //                   ],
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Text(
              //                       difference.toString(),
              //                       style: TextStyle(
              //                         fontSize: 13,
              //                         fontWeight: FontWeight.w400,
              //                         fontFamily: "Segoe UI",
              //                         color: AppColors.Drawer_COLOR,
              //                       ),
              //                     ),
              //                     SizedBox(width: 2,),
              //                     Text(
              //                       " يوم",
              //                       style: TextStyle(
              //                         fontSize: 13,
              //                         fontWeight: FontWeight.w500,
              //                         fontFamily: "Segoe UI",
              //                         color: AppColors.Drawer_COLOR,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //           // SizedBox(
              //           //   height: 7,
              //           // ),
              //
              //         ],
              //       ),
              //       // Column(
              //       //   children: [
              //       //     Text(
              //       //       "شهر مالي جديد",
              //       //       style: TextStyle(
              //       //           color: Colors.black,
              //       //           fontSize: 11,
              //       //           fontFamily: "Segoe UI",
              //       //           fontWeight: FontWeight.bold),
              //       //     ),
              //       //     SizedBox(
              //       //       child: Icon(
              //       //         Icons.arrow_forward,
              //       //         color: AppColors.Next_Back_COLOR,
              //       //         size: 30.0,
              //       //       ),
              //       //       width: 29,
              //       //       height: 43,
              //       //     ),
              //       //   ],
              //       // ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 6,
              // ),
              Container(
                height: 1.0,
                color: AppColors.Divider_COLOR.withOpacity(0.31),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 2),
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
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.Border_COLOR),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(3),
                          2: FlexColumnWidth(5),
                          3: FlexColumnWidth(5),
                          4: FlexColumnWidth(3),
                        },
                        border: TableBorder(
                            horizontalInside: BorderSide(
                                width: 1,
                                color: AppColors.Border_COLOR,
                                style: BorderStyle.solid),
                            verticalInside: BorderSide(
                                width: 1,
                                color: AppColors.Border_COLOR,
                                style: BorderStyle.solid)),

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
                              TableCell(
                                child: SizedBox(
                                  height: 50,
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
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                              ),
                              TableCell(
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
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    "The remainder of the savings"
                                        .tr(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Tajawal',
                                        color: Colors.white),
                                  ),
                                ),
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                              ),
                              TableCell(
                                child: Center(
                                  child:  Text(
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
                                 verticalAlignment: TableCellVerticalAlignment.middle,
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    "Exchange rate".tr(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Tajawal',
                                        color: Colors.white),
                                  ),
                                ),
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
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
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Tajawal',
                                          color: AppColors.Text_Table_COLOR),
                                    ),
                                  ),
                                ),
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    "Saver".tr(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Tajawal',
                                        color: AppColors.Text_Table_COLOR),
                                  ),
                                ),
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    NumberFormat('###,##0.00').format(
                                        provider.monthList.saveAmount -
                                            provider.monthList.totalSave),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Tajawal',
                                        color: AppColors.Text_Table_COLOR),
                                  ),
                                ),
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CalculateScreen(1,"Saver".tr(),provider
                                            .getRemainingAmount() +
                                            provider.monthList
                                                .saveAmount,provider
                                            .getRemainingAmount() +
                                            provider.monthList
                                                .saveAmount-provider
                                            .getRemainingAmount() +
                                            provider.monthList
                                                .totalSave,true);
                                      }).then((value) {
                                    //TODO: show yes no to add reminder amount to save amount
                                    if (value == null) {
                                    } else if ((double.parse(value) +
                                            provider.monthList.totalSave) >
                                        provider.monthList.saveAmount) {

                                      final snackBar = SnackBar(

                                          backgroundColor:
                                              AppColors.Snack_Bar_COLOR,
                                          content: Text(
                                            'The allowance exceeded the residual value of this item'
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
                                      showToast();
                                     //  timerSnackbar(
                                     //    context: context,
                                     //    contentText: "A snackbar with live timer.",
                                     //    afterTimeExecute: () => print("Operation Execute."),
                                     //    second: 1,
                                     //  );
                                      provider.changeTotalSave(value);
                                    }
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.only(
                                        bottomLeft:
                                        Radius.circular(
                                            10)),
                                  ),
                                  child: Center(
                                    child: provider.monthList.totalSave ==
                                        0
                                        ? Text(
                                        "Enter the value + ".tr(),
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
                                      NumberFormat('###,##0.00').format(
                                          provider.monthList.totalSave),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Tajawal',
                                          color: AppColors.Text_Table_COLOR),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10)),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      (provider.monthList.saveAmount == 0
                                                  ? 100
                                                  : provider.monthList
                                                          .totalSave /
                                                      provider.monthList
                                                          .saveAmount *
                                                      100)
                                              .toStringAsFixed(0) +
                                          "%",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Tajawal',
                                          color: AppColors.Text_Table_COLOR),
                                    ),
                                  ),
                                ),
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1.0,
                color: AppColors.Divider_COLOR.withOpacity(0.31),
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
                      height: 5,
                    ),
                    Table(
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
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(3),
                        2: FlexColumnWidth(5),
                        3: FlexColumnWidth(5),
                        4: FlexColumnWidth(3),
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
                            TableCell(
                              child: Container(
                                height: 50,
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
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  "The expenses".tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal',
                                      color: Colors.white),
                                ),
                              ),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  "The remainder of the expense"
                                      .tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal',
                                      color: Colors.white),
                                ),
                              ),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Text(
                                "Enter the expense amount"
                                    .tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Tajawal',
                                    color: Colors.white),
                              ),
                              /// star red ///
                              // Container(
                              //   padding: EdgeInsets.only(top: 10),
                              //   // height: 50,
                              //   child: Column(
                              //     crossAxisAlignment:
                              //         CrossAxisAlignment.center,
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.start,
                              //         children: [
                              //           SizedBox(
                              //             width: 12,
                              //           ),
                              //           StarRedCustom(
                              //             isHidden: true,
                              //           ),
                              //         ],
                              //       ),
                              //       SizedBox(
                              //         width: 2,
                              //       ),
                              //       Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         children: [
                              //           Flexible(
                              //             child: Text(
                              //               "Enter the amount of the expense"
                              //                   .tr(),
                              //               textAlign: TextAlign.center,
                              //               style: TextStyle(
                              //                   fontSize: 13,
                              //                   fontWeight: FontWeight.w500,
                              //                   fontFamily: 'Tajawal',
                              //                   color: Colors.white),
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              // ),
                               verticalAlignment: TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  "Exchange rate".tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal',
                                      color: Colors.white),
                                ),
                              ),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
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
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          columnWidths: {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(5),
                            3: FlexColumnWidth(5),
                            4: FlexColumnWidth(3),
                          },
                          children: [
                            for (int i = 0;
                                i < provider.monthList.expences.length;
                                i++)
                              TableRow(
                                decoration: BoxDecoration(
                                  color: AppColors.App_Bar_COLOR,
                                ),
                                children: [
                                  TableCell(
                                    child: SizedBox(
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(
                                      //     color: AppColors
                                      //         .Border_COLOR),
                                      //   borderRadius:
                                      //   BorderRadius.only(
                                      //     bottomRight: Radius.circular(i <
                                      //         provider
                                      //             .monthList
                                      //             .expences
                                      //             .length -
                                      //             1
                                      //         ? 0
                                      //         : 10),
                                      //   ),
                                      //   color: AppColors.No_Table_COLOR,
                                      // ),
                                      // width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                          (i + 1).toString(),
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Tajawal',
                                              color:
                                                  AppColors.Text_Table_COLOR),
                                        ),
                                      ),
                                    ),
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        provider.monthList.expences[i].type,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Tajawal',
                                            color:
                                                AppColors.Text_Table_COLOR),
                                      ),
                                    ),
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        NumberFormat('###,##0.00').format(
                                            provider.monthList.expences[i]
                                                    .amount -
                                                provider.monthList.expences[i]
                                                    .total),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Tajawal',
                                            color:
                                                AppColors.Text_Table_COLOR),
                                      ),
                                    ),
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                  ),
                                  TableCell(
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CalculateScreen(i+1,provider
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
                                                      .amount - provider
                                                      .monthList
                                                      .expences[
                                                  i]
                                                      .total,
                                                  true);
                                            }).then((value) {
                                          //TODO: show yes no to add reminder amount to save amount
                                          if (value == null) {
                                          } else if ((double.parse(value) +
                                                  provider.monthList
                                                      .expences[i].total) >
                                              provider.monthList.expences[i]
                                                  .amount) {
                                            final snackBar = SnackBar(
                                                backgroundColor:
                                                    AppColors.Snack_Bar_COLOR,
                                                content: Text(
                                                  'The allowance exceeded the residual value of this item'
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
                                            showToast();
                                            provider.changeTotalExpenses(
                                                value, i);
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
                                          child: provider.monthList.expences[i]
                                              .total ==
                                              0
                                              ? Text(
                                              "Enter the value + ".tr(),
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
                                              :  Text(
                                            NumberFormat('###,##0.00').format(
                                                provider.monthList.expences[i]
                                                    .total),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Tajawal',
                                                color: AppColors
                                                    .Text_Table_COLOR),
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        (provider.monthList.expences[i]
                                                            .amount ==
                                                        0
                                                    ? 100
                                                    : provider
                                                            .monthList
                                                            .expences[i]
                                                            .total /
                                                        provider
                                                            .monthList
                                                            .expences[i]
                                                            .amount *
                                                        100)
                                                .toStringAsFixed(0) +
                                            "%",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Tajawal',
                                            color:
                                                AppColors.Text_Table_COLOR),
                                      ),
                                    ),
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              // Container(
              //   height: 1.0,
              //   color: AppColors.Divider_COLOR.withOpacity(0.31),
              // ),
              // Container(
              //   padding:
              //       EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 15),
              //   child: Column(
              //     children: [
              //       // SizedBox(
              //       //   height: 7,
              //       // ),
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
              //         height: 8,
              //       ),
              //       Container(
              //         decoration: BoxDecoration(
              //           border: Border.all(color: AppColors.Border_COLOR),
              //           borderRadius: BorderRadius.only(
              //             topLeft: Radius.circular(10),
              //             topRight: Radius.circular(10),
              //             bottomRight: Radius.circular(10),
              //             bottomLeft: Radius.circular(10),
              //           ),
              //         ),
              //         child: Table(
              //           columnWidths: {
              //             0: FlexColumnWidth(2),
              //             1: FlexColumnWidth(3),
              //             2: FlexColumnWidth(4),
              //             3: FlexColumnWidth(5),
              //             4: FlexColumnWidth(4),
              //           },
              //           border: TableBorder(
              //               horizontalInside: BorderSide(
              //                   width: 1,
              //                   color: AppColors.Border_COLOR,
              //                   style: BorderStyle.solid),
              //               verticalInside: BorderSide(
              //                   width: 1,
              //                   color: AppColors.Border_COLOR,
              //                   style: BorderStyle.solid)),
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
              //                 TableCell(
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
              //                   verticalAlignment:
              //                       TableCellVerticalAlignment.middle,
              //                 ),
              //                 TableCell(
              //                   child: Container(
              //                     height: 50,
              //                     child: Center(
              //                       child: Text(
              //                         "Cash amount".tr(),
              //                         textAlign: TextAlign.center,
              //                         style: TextStyle(
              //                             fontSize: 13,
              //                             fontWeight: FontWeight.w500,
              //                             fontFamily: 'Tajawal',
              //                             color: Colors.white),
              //                       ),
              //                     ),
              //                   ),
              //                   verticalAlignment:
              //                       TableCellVerticalAlignment.middle,
              //                 ),
              //                 TableCell(
              //                   child: Center(
              //                     child: Text(
              //                       "The remainder of the monthly amount"
              //                           .tr(),
              //                       textAlign: TextAlign.center,
              //                       style: TextStyle(
              //                           fontSize: 13,
              //                           fontWeight: FontWeight.w500,
              //                           fontFamily: 'Tajawal',
              //                           color: Colors.white),
              //                     ),
              //                   ),
              //                   verticalAlignment:
              //                       TableCellVerticalAlignment.middle,
              //                 ),
              //                 TableCell(
              //                   child: Container(
              //                     padding: EdgeInsets.only(top: 8),
              //                     // height: 50,
              //                     child: Column(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.center,
              //                       children: [
              //                         Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.start,
              //                           children: [
              //                             SizedBox(
              //                               width: 12,
              //                             ),
              //                             StarRedCustom(
              //                               isHidden: true,
              //                             ),
              //                           ],
              //                         ),
              //                         SizedBox(
              //                           width: 2,
              //                         ),
              //                         Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.center,
              //                           children: [
              //                             Expanded(
              //                               child: Text(
              //                                 "Enter the amount of the expense"
              //                                     .tr(),
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
              //                 TableCell(
              //                   child: Center(
              //                     child: Text(
              //                       "Exchange rate".tr(),
              //                       textAlign: TextAlign.center,
              //                       style: TextStyle(
              //                           fontSize: 13,
              //                           fontWeight: FontWeight.w500,
              //                           fontFamily: 'Tajawal',
              //                           color: Colors.white),
              //                     ),
              //                   ),
              //                   verticalAlignment:
              //                       TableCellVerticalAlignment.middle,
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
              //                       textAlign: TextAlign.center,
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
              //                   child: Center(
              //                     child: Text(
              //                       NumberFormat('###,##0.00').format(
              //                           provider.monthList.cashAmount -
              //                               provider.monthList.totalCash),
              //                       textAlign: TextAlign.center,
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
              //                         //TODO: show yes no to add reminder amount to save amount
              //                         if (value == null) {
              //                         } else if ((double.parse(value) +
              //                                 provider.monthList.totalCash) >
              //                             provider.monthList.cashAmount) {
              //                           final snackBar = SnackBar(
              //                               backgroundColor:
              //                                   AppColors.Snack_Bar_COLOR,
              //                               content: Text(
              //                                 'The allowance exceeded the residual value of this item'
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
              //                           showToast();
              //                           provider.changeTotalCash(value);
              //                         }
              //                       });
              //                     },
              //                     child: Container(
              //                       child: Center(
              //                         child: Text(
              //                           NumberFormat('###,##0.00').format(
              //                               provider.monthList.totalCash),
              //                           textAlign: TextAlign.center,
              //                           style: TextStyle(
              //                               fontSize: 13,
              //                               fontWeight: FontWeight.w500,
              //                               fontFamily: 'Tajawal',
              //                               color:
              //                                   AppColors.Text_Table_COLOR),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                   verticalAlignment:
              //                       TableCellVerticalAlignment.middle,
              //                 ),
              //                 TableCell(
              //                   child: Center(
              //                     child: Text(
              //                       (provider.monthList.cashAmount == 0
              //                                   ? 100
              //                                   : provider
              //                                           .monthList.totalCash /
              //                                       provider.monthList
              //                                           .cashAmount *
              //                                       100)
              //                               .toStringAsFixed(0) +
              //                           "%",
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
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        );
      }),

    );
  }
/// timer snackbar ///
  //  timerSnackbar(
  //  context: context,
  //  contentText: "A snackbar with live timer.",
  //  afterTimeExecute: () => print("Operation Execute."),
  //  second: 1,
  //   );
  void showToast() {
    final snackBar = SnackBar(
      duration: Duration(seconds: 6),
      backgroundColor: AppColors.Snack_Bar_COLOR,
      content: Text(
        'Entered value is approved'.tr(),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: "Segoe UI"),
      ),
      action: SnackBarAction(
        label: 'Undo'.tr(),
        textColor: Colors.black,
        onPressed: () {
          Provider.of<HomeProvider>(context, listen: false).reverseValue();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openEndDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }
}
