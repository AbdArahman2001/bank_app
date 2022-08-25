// import 'package:bank/screens/cards/cards_screen.dart';
// import 'package:bank/screens/cards/custom/delete_custom_dialog.dart';
// import 'package:bank/providers/home_provider.dart';
// import 'package:bank/screens/cards/custom/reminder_custom_dialog.dart';
// import 'package:bank/screens/custom_screen/calculate_screen.dart';
// import 'package:bank/screens/custom_screen/star_red_custom.dart';
// import 'package:bank/screens/salary/table_of_salary.dart';
// import 'package:bank/utlies/app_colors.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'dart:math' as math;
//
// enum SelectedRow { yes, no }
//
// class MonthlyIncomeScreen extends StatefulWidget {
//   static final routeName = "monthlyIncomeScreen";
//
//   @override
//   _MonthlyIncomeScreenState createState() => _MonthlyIncomeScreenState();
// }
//
// class _MonthlyIncomeScreenState extends State<MonthlyIncomeScreen> {
//   FocusNode myFocusNode;
//   HomeProvider provider;
//   SelectedRow _character = SelectedRow.yes;
//   String result = "";
//
//   @override
//   void initState() {
//     super.initState();
//     myFocusNode = FocusNode();
//   }
//
//   @override
//   void dispose() {
//     myFocusNode.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     provider = Provider.of<HomeProvider>(context);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: AppColors.Back_Ground_COLOR,
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "جدول راتبك",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontFamily: "Segoe UI",
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         backgroundColor: AppColors.MAIN_COLOR,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.arrow_forward),
//             onPressed: () {
//               //TODO: show yes no to add reminder amount to save amount
//               provider.validateMonthlyIncome().then((v) {
//                 if (v is bool && v) {
//                   if (provider.getRemainingAmount() > 0) {
//                     showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return ReminderCustomDialog();
//                         }).then((value) {
//                       if (value is bool && value) {
//                         provider.monthList.saveAmount +=
//                             provider.getRemainingAmount();
//                         Provider.of<HomeProvider>(context, listen: false)
//                             .saveList();
//                         Navigator.pushReplacementNamed(
//                             context, TableOfSaralyScreen.routeName);
//                       }
//                       ;
//                     });
//                   } else {
//                     Provider.of<HomeProvider>(context, listen: false)
//                         .saveList();
//                     Navigator.pushReplacementNamed(
//                         context, TableOfSaralyScreen.routeName);
//                   }
//                 } else {
//                   var snackBar = SnackBar(
//                       backgroundColor: AppColors.Snack_Bar_COLOR,
//                       content: Text(
//                         v,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: "Segoe UI"),
//                       ));
//                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                 }
//               });
//             },
//           ),
//         ],
//         leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//       ),
//       body: Consumer<HomeProvider>(builder: (context, provider, x) {
//         return Container(
//           // height: MediaQuery.of(context).size.height,
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(
//                   left: 16,
//                   right: 16,
//                   top: 5,
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 87,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.black.withOpacity(0.16),
//                               spreadRadius: 3,
//                               blurRadius: 6),
//                         ],
//                       ),
//                       padding: EdgeInsets.only(
//                           left: 15, right: 15, top: 8, bottom: 8),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "مصدر الدخل الشهري",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w900,
//                                   fontFamily: "Segoe UI",
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               Spacer(),
//                               GestureDetector(
//                                 onTap: () {
//                                   showDialog(
//                                       context: context,
//                                       builder: (BuildContext context) {
//                                         return CalculateScreen();
//                                       }).then((value) {
//                                     // TODO: show error message if amount not correct
//                                     if (value == null) {
//                                     } else if (double.parse(value) <
//                                         provider
//                                             .getSumSaveExpencesCashAmount()) {
//                                       const snackBar = SnackBar(
//                                           backgroundColor: AppColors.Snack_Bar_COLOR,
//                                           content: Text(
//                                             'الراتب لا يتناسب مع مجموع المصاريف يرجى إما زيادة الراتب إو تقليل المصاريف',
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                                 fontSize: 20,
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.w500,
//                                                 fontFamily: "Segoe UI"),
//                                           ));
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(snackBar);
//                                     } else {
//                                       provider.changeSalaryAmount(value);
//                                     }
//                                   });
//                                 },
//                                 child: Container(
//                                   height: 30,
//                                   width: 30,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           "assets/images/addadd.png"),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 2,
//                               ),
//                               Container(
//                                 height: 29,
//                                 width: 93,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.grey.shade200,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: AppColors.MAIN_COLOR,
//                                         spreadRadius: 1),
//                                   ],
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     NumberFormat('###,##0.00').format(provider.monthList.salaryAmount
//                                         ),
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w400,
//                                       fontFamily: "Segoe UI",
//                                       color: AppColors.Drawer_COLOR,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "المتبقي من مصدر الدخل الشهري بعد الجدولة",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w900,
//                                   fontFamily: "Segoe UI",
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               Spacer(),
//                               Container(
//                                 height: 29,
//                                 width: 93,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.grey.shade200,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: AppColors.MAIN_COLOR,
//                                         spreadRadius: 1),
//                                   ],
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     NumberFormat('###,##0.00').format(provider.getRemainingAmount()
//                                     ),
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w400,
//                                       fontFamily: "Segoe UI",
//                                       color: AppColors.Drawer_COLOR,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 14,
//                     ),
//                     Container(
//                       height: 1.0,
//                       color: AppColors.Border_COLOR,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 provider.addExpense();
//                               },
//                               child: Container(
//                                 width:
//                                     (MediaQuery.of(context).size.width - 32) /
//                                         3,
//                                 height: 24,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: AppColors.MAIN_COLOR,
//                                         spreadRadius: 1),
//                                   ],
//                                   image: DecorationImage(
//                                     image: AssetImage("assets/images/Plus.png"),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 4,
//                             ),
//                             Text(
//                               "إضافة مصروف",
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w600,
//                                 fontFamily: "Segoe UI",
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 provider.resetValues();
//                               },
//                               child: Container(
//                                 width:
//                                     (MediaQuery.of(context).size.width - 32) /
//                                         3,
//                                 height: 24,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: AppColors.MAIN_COLOR,
//                                         spreadRadius: 1),
//                                   ],
//                                   image: DecorationImage(
//                                     image: AssetImage("assets/images/loop.png"),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 4,
//                             ),
//                             Text(
//                               "تصفير القيم",
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w600,
//                                 fontFamily: "Segoe UI",
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 provider.changeDeleteEnable();
//                               },
//                               child: Container(
//                                 width:
//                                     (MediaQuery.of(context).size.width - 32) /
//                                         3,
//                                 height: 24,
//                                 decoration: BoxDecoration(
//                                   // borderRadius: BorderRadius.only(
//                                   //     topLeft: Radius.circular(5),
//                                   //     bottomLeft: Radius.circular(5)),
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: AppColors.MAIN_COLOR,
//                                         spreadRadius: 1),
//                                   ],
//                                   image: DecorationImage(
//                                     image:
//                                         AssetImage("assets/images/close.png"),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 4,
//                             ),
//                             Text(
//                               "حذف مصروف",
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w600,
//                                 fontFamily: "Segoe UI",
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 8,
//                     ),
//                     Container(
//                       height: 1.0,
//                       color: AppColors.Border_COLOR,
//                     ),
//                     SizedBox(
//                       // height: 26,
//                       height: 5,
//                     ),
//                     Container(
//                       // padding: EdgeInsets.only(top: 7),
//                       child: Column(
//                         children: [
//                           // SizedBox(
//                           //   height: 7,
//                           // ),
//                           Text(
//                             "المدخر الشهري",
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w900,
//                               fontFamily: "Segoe UI",
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(
//                             // height: 13,
//                             height: 5,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(color: AppColors.Border_COLOR),
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(10),
//                                   topRight: Radius.circular(10),
//                                   bottomRight: Radius.circular(10),
//                                   bottomLeft: Radius.circular(10)),
//                             ),
//                             child: Table(
//                               columnWidths: {
//                                 0: FlexColumnWidth(1),
//                                 1: FlexColumnWidth(4),
//                                 2: FlexColumnWidth(4),
//                               },
//                               border: TableBorder(
//                                 horizontalInside: BorderSide(
//                                     width: 1,
//                                     color: AppColors.Border_COLOR,
//                                     style: BorderStyle.solid),
//                                 verticalInside: BorderSide(
//                                     width: 1,
//                                     color: AppColors.Border_COLOR,
//                                     style: BorderStyle.solid),
//                               ),
//
//                               // border:
//                               //     TableBorder.all(color: AppColors.Border_COLOR),
//                               children: [
//                                 TableRow(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(10),
//                                       topRight: Radius.circular(10),
//                                     ),
//                                     color: AppColors.BG_Table_COLOR,
//                                   ),
//                                   children: [
//                                     SizedBox(
//                                       height: 40,
//                                       // decoration: BoxDecoration(
//                                       //   borderRadius: BorderRadius.only(
//                                       //       topRight: Radius.circular(10)),
//                                       //   border: Border.all(
//                                       //       color: AppColors.Border_COLOR),
//                                       //   color: AppColors.MAIN_COLOR,
//                                       // ),
//                                       child: Center(
//                                         child: Text(
//                                           "NO",
//                                           style: TextStyle(
//                                               fontSize: 13,
//                                               fontFamily: 'Tajawal',
//                                               fontWeight: FontWeight.w500,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 40,
//                                       // decoration: BoxDecoration(
//                                       //   border: Border.all(
//                                       //       color: AppColors.Border_COLOR),
//                                       //   color: AppColors.MAIN_COLOR,
//                                       // ),
//                                       child: Center(
//                                         child: Text(
//                                           "المدخر",
//                                           style: TextStyle(
//                                               fontSize: 13,
//                                               fontWeight: FontWeight.w500,
//                                               fontFamily: 'Tajawal',
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     TableCell(
//                                       child: SizedBox(
//                                         // decoration: BoxDecoration(
//                                         //   borderRadius: BorderRadius.only(
//                                         //       topLeft: Radius.circular(10)),
//                                         //   border: Border.all(
//                                         //       color: AppColors.Border_COLOR),
//                                         //   color: AppColors.MAIN_COLOR,
//                                         // ),
//                                         // padding: EdgeInsets.only(top: 10),
//                                         height: 40,
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: [
//                                                 Padding(
//                                                   padding:
//                                                       EdgeInsets.only(top: 10),
//                                                 ),
//                                                 StarRedCustom(
//                                                   isHidden: true,
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               width: 2,
//                                             ),
//                                             Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: [
//                                                 Padding(
//                                                   padding:
//                                                       EdgeInsets.only(top: 10),
//                                                 ),
//                                                 Expanded(
//                                                   child: Text(
//                                                     "أدخل قيمة المدخر الشهري",
//                                                     textAlign: TextAlign.center,
//                                                     style: TextStyle(
//                                                         fontSize: 13,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         fontFamily: 'Tajawal',
//                                                         color: Colors.white),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 TableRow(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                         bottomRight: Radius.circular(10),
//                                         bottomLeft: Radius.circular(10)),
//                                     color: AppColors.bg_COLOR,
//                                   ),
//                                   children: [
//                                     TableCell(
//                                       child: SizedBox(
//                                         height: 40,
//                                         // decoration: BoxDecoration(
//                                         //   borderRadius: BorderRadius.only(
//                                         //       bottomRight: Radius.circular(10)),
//                                         //   color: AppColors.No_Table_COLOR,
//                                         // ),
//                                         // width:
//                                         //     MediaQuery.of(context).size.width,
//                                         child: Center(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                                 fontSize: 13,
//                                                 fontWeight: FontWeight.w500,
//                                                 fontFamily: 'Tajawal',
//                                                 color:
//                                                     AppColors.Text_Table_COLOR),
//                                           ),
//                                         ),
//                                       ),
//                                       verticalAlignment:
//                                           TableCellVerticalAlignment.middle,
//                                     ),
//                                     TableCell(
//                                       child: Center(
//                                         child: Text(
//                                           "المدخر",
//                                           style: TextStyle(
//                                               fontSize: 13,
//                                               fontWeight: FontWeight.w500,
//                                               fontFamily: 'Tajawal',
//                                               color:
//                                                   AppColors.Text_Table_COLOR),
//                                         ),
//                                       ),
//                                       verticalAlignment:
//                                           TableCellVerticalAlignment.middle,
//                                     ),
//                                     TableCell(
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           showDialog(
//                                               context: context,
//                                               builder: (BuildContext context) {
//                                                 return CalculateScreen();
//                                               }).then((value) {
//                                             // TODO: show error message if amount not correct
//                                             if (value == null) {
//                                             } else if (double.parse(value) >
//                                                 (provider.getRemainingAmount() +
//                                                     provider.monthList
//                                                         .saveAmount)) {
//                                               const snackBar = SnackBar(
//                                                   backgroundColor:
//                                                   AppColors.Snack_Bar_COLOR,
//                                                   content: Text(
//                                                     'الراتب لا يتناسب مع مجموع المصاريف يرجى إما زيادة الراتب إو تقليل المصاريف',
//                                                     textAlign: TextAlign.center,
//                                                     style: TextStyle(
//                                                         fontSize: 20,
//                                                         color: Colors.white,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         fontFamily: "Segoe UI"),
//                                                   ));
//                                               ScaffoldMessenger.of(context)
//                                                   .showSnackBar(snackBar);
//                                             } else {
//                                               provider.changeSaveAmount(value);
//                                             }
//                                           });
//                                         },
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.only(
//                                                 bottomLeft:
//                                                     Radius.circular(10)),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//         NumberFormat('###,##0.00').format(provider.monthList.saveAmount
//                                                   ),
//                                               style: TextStyle(
//                                                 fontSize: 13,
//                                                 fontWeight: FontWeight.w400,
//                                                 fontFamily: "Segoe UI",
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       verticalAlignment:
//                                           TableCellVerticalAlignment.middle,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 // height: 27,
//                 height: 10,
//               ),
//               Container(
//                 height: 1.0,
//                 color: AppColors.Divider_COLOR,
//               ),
//               Container(
//                 padding: EdgeInsets.only(left: 16, top: 4, right: 16),
//                 child: Column(
//                   children: [
//                     Container(
//                       child: Text(
//                         "قائمة المصاريف الشهرية",
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w900,
//                           fontFamily: "Segoe UI",
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     Table(
//                       border: TableBorder(
//                         horizontalInside: BorderSide(
//                             width: 1,
//                             color: AppColors.Border_COLOR,
//                             style: BorderStyle.solid),
//                         verticalInside: BorderSide(
//                             width: 1,
//                             color: AppColors.Border_COLOR,
//                             style: BorderStyle.solid),
//                       ),
//                       columnWidths: provider.isDeleteEnable
//                           ? {
//                               0: FlexColumnWidth(1),
//                               1: FlexColumnWidth(1.3),
//                               2: FlexColumnWidth(4),
//                               3: FlexColumnWidth(4),
//                             }
//                           : {
//                               0: FlexColumnWidth(1),
//                               1: FlexColumnWidth(4),
//                               2: FlexColumnWidth(4),
//                             },
//                       children: [
//                         TableRow(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10),
//                             ),
//                             color: AppColors.BG_Table_COLOR,
//                           ),
//                           children: !provider.isDeleteEnable
//                               ? [
//                                   SizedBox(
//                                     height: 40,
//                                     // decoration: BoxDecoration(
//                                     //   border: Border.all(
//                                     //       color: AppColors.Border_COLOR),
//                                     //   borderRadius: BorderRadius.only(
//                                     //     topRight: Radius.circular(10),
//                                     //   ),
//                                     //   color: AppColors.MAIN_COLOR,
//                                     // ),
//                                     child: Center(
//                                       child: Text(
//                                         "NO",
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             fontFamily: 'Tajawal',
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 40,
//                                     // decoration: BoxDecoration(
//                                     //   border: Border.all(
//                                     //       color: AppColors.Border_COLOR),
//                                     //   color: AppColors.MAIN_COLOR,
//                                     // ),
//                                     child: Center(
//                                       child: Text(
//                                         "المصروف",
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             fontWeight: FontWeight.w500,
//                                             fontFamily: 'Tajawal',
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 40,
//                                     // decoration: BoxDecoration(
//                                     //   border: Border.all(
//                                     //       color: AppColors.Border_COLOR),
//                                     //   borderRadius: BorderRadius.only(
//                                     //       topLeft: Radius.circular(10)),
//                                     //   color: AppColors.MAIN_COLOR,
//                                     // ),
//                                     // padding: EdgeInsets.only(top: 3),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       // crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsets.only(top: 3),
//                                             ),
//                                             StarRedCustom(
//                                               isHidden: true,
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           width: 2,
//                                         ),
//                                         Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsets.only(top: 3),
//                                             ),
//                                             Text(
//                                               // "أدخل قيم الجدولة \n للمصاريف الشهرية",
//                                               "أدخل قيم الجدولة",
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontSize: 13,
//                                                   fontWeight: FontWeight.w500,
//                                                   fontFamily: 'Tajawal',
//                                                   color: Colors.white),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ]
//                               : [
//                                   GestureDetector(
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           // border: Border.all(),
//                                           borderRadius: BorderRadius.only(
//                                             bottomRight: Radius.circular(0),
//                                           ),
//                                           color: AppColors.Back_Ground_COLOR,
//                                           image: DecorationImage(
//                                             image: AssetImage(
//                                                 "assets/images/delete_black.png"),
//                                           ),
//                                         ),
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         height: 40,
//                                       ),
//                                       onTap: () {
//                                         showDialog(
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               return DeleteCustomDialog();
//                                             }).then((value) {
//                                           if (value is bool && value) {
//                                             provider.changeDeleteEnable();
//                                             provider.removeExpense();
//                                           }
//                                           ;
//                                         });
//                                       }),
//                                   SizedBox(
//                                     height: 40,
//                                     // decoration: BoxDecoration(
//                                     //   border: Border.all(
//                                     //       color: AppColors.Border_COLOR),
//                                     //   borderRadius: BorderRadius.only(
//                                     //     topRight: Radius.circular(10),
//                                     //   ),
//                                     //   color: AppColors.MAIN_COLOR,
//                                     // ),
//                                     child: Center(
//                                       child: Text(
//                                         "NO",
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             fontFamily: 'Tajawal',
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 40,
//                                     // decoration: BoxDecoration(
//                                     //   border: Border.all(
//                                     //       color: AppColors.Border_COLOR),
//                                     //   color: AppColors.MAIN_COLOR,
//                                     // ),
//                                     child: Center(
//                                       child: Text(
//                                         "المصروف",
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             fontWeight: FontWeight.w500,
//                                             fontFamily: 'Tajawal',
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 40,
//                                     // decoration: BoxDecoration(
//                                     //   border: Border.all(
//                                     //       color: AppColors.Border_COLOR),
//                                     //   borderRadius: BorderRadius.only(
//                                     //       topLeft: Radius.circular(10)),
//                                     //   color: AppColors.MAIN_COLOR,
//                                     // ),
//                                     // padding: EdgeInsets.only(top: 3),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       // crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsets.only(top: 3),
//                                             ),
//                                             StarRedCustom(
//                                               isHidden: true,
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           width: 2,
//                                         ),
//                                         Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsets.only(top: 3),
//                                             ),
//                                             Text(
//                                               // "أدخل قيم الجدولة \n للمصاريف الشهرية",
//                                               "أدخل قيم الجدولة",
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontSize: 13,
//                                                   fontWeight: FontWeight.w500,
//                                                   fontFamily: 'Tajawal',
//                                                   color: Colors.white),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       // SizedBox(
//                       //   // height: 16,
//                       //   height: 4,
//                       // ),
//                       Container(
//                         padding: EdgeInsets.only(left: 16, top: 4),
//                         child: Column(
//                           children: [
//                             // SizedBox(
//                             //   height: 7,
//                             // ),
//                             //TODO: delete empty expences name
//
//                             // SizedBox(
//                             //   height: 13,
//                             // ),
//                             Container(
//                               padding: EdgeInsets.only(right: 16),
//                               // decoration: BoxDecoration(
//                               //   borderRadius:
//                               //       BorderRadius.only( topRight:Radius.circular(10)),
//                               // ),
//                               child: Table(
//                                 border: TableBorder(
//         top: BorderSide(color: AppColors.Border_COLOR,),
//         right:  BorderSide(color: AppColors.Border_COLOR,),
//         bottom:  BorderSide(color: AppColors.Border_COLOR,),
//         left:  BorderSide(color: AppColors.Border_COLOR,),
//         horizontalInside:  BorderSide(color: AppColors.Border_COLOR,),
//         verticalInside:  BorderSide(color: AppColors.Border_COLOR,),
//         borderRadius:  BorderRadius.only(bottomRight: Radius.circular(10),
//         bottomLeft: Radius.circular(10),),
//         ),
//
//         // TableBorder(
//         //                           horizontalInside: BorderSide(
//         //                               width: 1,
//         //                               color: AppColors.Border_COLOR,
//         //                               style: BorderStyle.solid),
//         //                           verticalInside: BorderSide(
//         //                               width: 1,
//         //                               color: AppColors.Border_COLOR,
//         //                               style: BorderStyle.solid),
//         //                         ),
//                                 columnWidths: provider.isDeleteEnable
//                                     ? {
//                                         0: FlexColumnWidth(1),
//                                         1: FlexColumnWidth(1.3),
//                                         2: FlexColumnWidth(4),
//                                         3: FlexColumnWidth(4),
//                                       }
//                                     : {
//                                         0: FlexColumnWidth(1),
//                                         1: FlexColumnWidth(4),
//                                         2: FlexColumnWidth(4),
//                                       },
//                                 children: [
//                                   for (int i = 0;
//                                       i < provider.monthList.expences.length;
//                                       i++)
//                                     TableRow(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.only(
//                                           bottomRight: Radius.circular(i <
//                                                   provider.monthList.expences
//                                                           .length -
//                                                       1
//                                               ? 0
//                                               : 10),
//                                           bottomLeft: Radius.circular(i <
//                                                   provider.monthList.expences
//                                                           .length -
//                                                       1
//                                               ? 0
//                                               : 10),
//                                         ),
//                                         color: AppColors.bg_COLOR,
//                                       ),
//                                       children: provider.isDeleteEnable
//                                           ? [
//                                               SizedBox(
//                                                 // decoration: BoxDecoration(
//                                                 //   // border: Border.all(),
//                                                 //   borderRadius: BorderRadius.only(
//                                                 //       bottomRight: Radius.circular(i <
//                                                 //               provider
//                                                 //                       .monthList
//                                                 //                       .expences
//                                                 //                       .length -
//                                                 //                   1
//                                                 //           ? 0
//                                                 //           : 10)),
//                                                 //   color: AppColors
//                                                 //       .Back_Ground_COLOR,
//                                                 // ),
//                                                 // width: MediaQuery.of(context)
//                                                 //     .size
//                                                 //     .width,
//                                                 height: 40,
//                                                 child: Center(
//                                                   child: Checkbox(
//                                                     shape: CircleBorder(),
//                                                     tristate: false,
//                                                     // splashRadius: 30,
//                                                     checkColor: Colors.white,
//                                                     activeColor:
//                                                         AppColors.MAIN_COLOR,
//                                                     value: provider.monthList
//                                                         .expences[i].isSelect,
//                                                     onChanged: (value) {
//                                                       provider
//                                                               .monthList
//                                                               .expences[i]
//                                                               .isSelect =
//                                                           !provider
//                                                               .monthList
//                                                               .expences[i]
//                                                               .isSelect;
//
//                                                       provider
//                                                           .notifyListeners();
//                                                     },
//                                                     // controlAffinity: ListTileControlAffinity
//                                                     //     .leading, //  <-- leading Checkbox
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 // decoration: BoxDecoration(
//                                                 //   border: Border.all(
//                                                 //       color: AppColors
//                                                 //           .Border_COLOR),
//                                                 //   borderRadius:
//                                                 //       BorderRadius.only(
//                                                 //     bottomRight: Radius.circular(i <
//                                                 //             provider
//                                                 //                     .monthList
//                                                 //                     .expences
//                                                 //                     .length -
//                                                 //                 1
//                                                 //         ? 0
//                                                 //         : 10),
//                                                 //   ),
//                                                 //   color:
//                                                 //       AppColors.No_Table_COLOR,
//                                                 // ),
//                                                 // width: MediaQuery.of(context)
//                                                 //     .size
//                                                 //     .width,
//                                                 height: 40,
//                                                 child: Center(
//                                                   child: Text(
//                                                     (i + 1).toString(),
//                                                     style: TextStyle(
//                                                         fontSize: 13,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         fontFamily: 'Tajawal',
//                                                         color: AppColors
//                                                             .Text_Table_COLOR),
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 40,
//                                                 child: Center(
//                                                   child: TextFormField(
//                                                     maxLength: 15,
//                                                     // maxLines: null,
//                                                     initialValue: provider
//                                                         .monthList
//                                                         .expences[i]
//                                                         .type,
//                                                     onChanged: (text) {
//                                                       provider
//                                                           .monthList
//                                                           .expences[i]
//                                                           .type = text;
//                                                     },
//
//                                                     // focusNode: myFocusNode,
//                                                     textAlign: TextAlign.center,
//                                                     decoration: InputDecoration(
//                                                       counterText: "",
//         enabledBorder: InputBorder.none,
//                                                       // enabledBorder:
//                                                       //     UnderlineInputBorder(
//                                                       //   borderSide: BorderSide(
//                                                       //       color: AppColors
//                                                       //           .Border_COLOR),
//                                                       // ),
//                                                       // enabledBorder:
//                                                       //                                                   OutlineInputBorder(
//                                                       //                                                 borderSide: BorderSide(
//                                                       //                                                     color: AppColors
//                                                       //                                                         .Border_COLOR),
//                                                       //                                               ),
//                                                       hintText: "المصروف",
//                                                       labelStyle: TextStyle(
//                                                         fontSize: 13,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         fontFamily: 'Tajawal',
//                                                         color: AppColors
//                                                             .Text_Table_COLOR,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 40,
//                                                 // decoration: BoxDecoration(
//                                                 //   borderRadius:
//                                                 //       BorderRadius.only(
//                                                 //     bottomLeft: Radius.circular(i <
//                                                 //             provider
//                                                 //                     .monthList
//                                                 //                     .expences
//                                                 //                     .length -
//                                                 //                 1
//                                                 //         ? 0
//                                                 //         : 10),
//                                                 //   ),
//                                                 //   border: Border.all(
//                                                 //       color: AppColors
//                                                 //           .Border_COLOR),
//                                                 //   color:
//                                                 //       AppColors.App_Bar_COLOR,
//                                                 // ),
//                                                 child: GestureDetector(
//                                                   onTap: () {
//                                                     showDialog(
//                                                         context: context,
//                                                         builder: (BuildContext
//                                                             context) {
//                                                           return CalculateScreen();
//                                                         }).then((value) {
//                                                       // TODO: show error message if amount not correct
//                                                       if (value == null) {
//                                                       } else if (double.parse(
//                                                               value) >
//                                                           (provider
//                                                                   .getRemainingAmount() +
//                                                               provider
//                                                                   .monthList
//                                                                   .expences[i]
//                                                                   .amount)) {
//                                                         const snackBar =
//                                                             SnackBar(
//                                                                 backgroundColor:
//                                                                     Colors
//                                                                         .redAccent,
//                                                                 content: Text(
//                                                                   'الراتب لا يتناسب مع مجموع المصاريف يرجى إما زيادة الراتب إو تقليل المصاريف',
//                                                                   textAlign:
//                                                                       TextAlign
//                                                                           .center,
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           20,
//                                                                       color: Colors
//                                                                           .white,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500,
//                                                                       fontFamily:
//                                                                           "Segoe UI"),
//                                                                 ));
//                                                         ScaffoldMessenger.of(
//                                                                 context)
//                                                             .showSnackBar(
//                                                                 snackBar);
//                                                       } else {
//                                                         provider
//                                                             .changeExpensesAmount(
//                                                                 value, i);
//                                                       }
//                                                     });
//                                                   },
//                                                   child: SizedBox(
//                                                     // decoration: BoxDecoration(
//                                                     //   borderRadius:
//                                                     //       BorderRadius.only(
//                                                     //     bottomLeft: Radius.circular(i <
//                                                     //             provider
//                                                     //                     .monthList
//                                                     //                     .expences
//                                                     //                     .length -
//                                                     //                 1
//                                                     //         ? 0
//                                                     //         : 10),
//                                                     //   ),
//                                                     // ),
//                                                     child: Center(
//                                                       child: Text(
//         NumberFormat('###,##0.00').format(provider.monthList
//                                                             .expences[i].amount
//                                                             ),
//                                                         textAlign:
//                                                             TextAlign.center,
//                                                         style: TextStyle(
//                                                             fontSize: 13,
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                             fontFamily:
//                                                                 'Tajawal',
//                                                             color: AppColors
//                                                                 .Text_Table_COLOR),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ]
//                                           : [
//                                               SizedBox(
//                                                 // decoration: BoxDecoration(
//                                                 //   border: Border.all(
//                                                 //       color: AppColors
//                                                 //           .Border_COLOR),
//                                                 //   borderRadius:
//                                                 //       BorderRadius.only(
//                                                 //     bottomRight: Radius.circular(i <
//                                                 //             provider
//                                                 //                     .monthList
//                                                 //                     .expences
//                                                 //                     .length -
//                                                 //                 1
//                                                 //         ? 0
//                                                 //         : 10),
//                                                 //   ),
//                                                 //   color:
//                                                 //       AppColors.No_Table_COLOR,
//                                                 // ),
//                                                 // width: MediaQuery.of(context)
//                                                 //     .size
//                                                 //     .width,
//                                                 height: 40,
//                                                 child: Center(
//                                                   child: Text(
//                                                     (i + 1).toString(),
//                                                     style: TextStyle(
//                                                         fontSize: 13,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         fontFamily: 'Tajawal',
//                                                         color: AppColors
//                                                             .Text_Table_COLOR),
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 40,
//                                                 // decoration: BoxDecoration(
//                                                 //   // border: Border.all(
//                                                 //   //     color: AppColors
//                                                 //   //         .Border_COLOR),
//                                                 //   color:
//                                                 //       AppColors.App_Bar_COLOR,
//                                                 // ),
//                                                 child: Center(
//                                                   child: TextFormField(
//                                                     maxLength: 15,
//                                                     // maxLines: null,
//                                                     initialValue: provider
//                                                         .monthList
//                                                         .expences[i]
//                                                         .type,
//                                                     onChanged: (text) {
//                                                       provider
//                                                           .monthList
//                                                           .expences[i]
//                                                           .type = text;
//                                                     },
//                                                     // focusNode: myFocusNode,
//                                                     textAlign: TextAlign.center,
//                                                     decoration: InputDecoration(
//                                                       counterText: "",
//                                                       contentPadding:
//                                                           EdgeInsets.zero,
//         enabledBorder: InputBorder.none,
//         //                                               enabledBorder:
//         // UnderlineInputBorder(
//         // borderSide: BorderSide(
//         // color: AppColors
//         //     .Border_COLOR),
//         // ),
//                                                       hintText: "المصروف",
//                                                       labelStyle: TextStyle(
//                                                         fontSize: 13,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         fontFamily: 'Tajawal',
//                                                         color: AppColors
//                                                             .Text_Table_COLOR,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 40,
//                                                 // decoration: BoxDecoration(
//                                                 //   borderRadius:
//                                                 //       BorderRadius.only(
//                                                 //     bottomLeft: Radius.circular(i <
//                                                 //             provider
//                                                 //                     .monthList
//                                                 //                     .expences
//                                                 //                     .length -
//                                                 //                 1
//                                                 //         ? 0
//                                                 //         : 10),
//                                                 //   ),
//                                                 //   border: Border.all(
//                                                 //       color: AppColors
//                                                 //           .Border_COLOR),
//                                                 //   color:
//                                                 //       AppColors.App_Bar_COLOR,
//                                                 // ),
//                                                 child: GestureDetector(
//                                                   onTap: () {
//                                                     showDialog(
//                                                         context: context,
//                                                         builder: (BuildContext
//                                                             context) {
//                                                           return CalculateScreen();
//                                                         }).then((value) {
//                                                       // TODO: show error message if amount not correct
//                                                       if (value == null) {
//                                                       } else if (double.parse(
//                                                               value) >
//                                                           (provider
//                                                                   .getRemainingAmount() +
//                                                               provider
//                                                                   .monthList
//                                                                   .expences[i]
//                                                                   .amount)) {
//                                                         const snackBar =
//                                                             SnackBar(
//                                                                 backgroundColor:
//                                                                     Colors
//                                                                         .redAccent,
//                                                                 content: Text(
//                                                                   'الراتب لا يتناسب مع مجموع المصاريف يرجى إما زيادة الراتب إو تقليل المصاريف',
//                                                                   textAlign:
//                                                                       TextAlign
//                                                                           .center,
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           20,
//                                                                       color: Colors
//                                                                           .white,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500,
//                                                                       fontFamily:
//                                                                           "Segoe UI"),
//                                                                 ));
//                                                         ScaffoldMessenger.of(
//                                                                 context)
//                                                             .showSnackBar(
//                                                                 snackBar);
//                                                       } else {
//                                                         provider
//                                                             .changeExpensesAmount(
//                                                                 value, i);
//                                                       }
//                                                     });
//                                                   },
//                                                   child: SizedBox(
//                                                     // decoration: BoxDecoration(
//                                                     //   borderRadius:
//                                                     //       BorderRadius.only(
//                                                     //     bottomLeft: Radius.circular(i <
//                                                     //             provider
//                                                     //                     .monthList
//                                                     //                     .expences
//                                                     //                     .length -
//                                                     //                 1
//                                                     //         ? 0
//                                                     //         : 10),
//                                                     //   ),
//                                                     // ),
//                                                     child: Center(
//                                                       child: Text(
//         NumberFormat('###,##0.00').format(provider.monthList
//                                                             .expences[i].amount
//                                                             ),
//                                                         textAlign:
//                                                             TextAlign.center,
//                                                         style: TextStyle(
//                                                             fontSize: 13,
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                             fontFamily:
//                                                                 'Tajawal',
//                                                             color: AppColors
//                                                                 .Text_Table_COLOR),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                     ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 1.0,
//                 color: AppColors.Divider_COLOR,
//               ),
//               Container(
//                 padding: EdgeInsets.only(left: 16, right: 16),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Text(
//                       "المبلغ النقدي",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w900,
//                         fontFamily: "Segoe UI",
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(
//                       // height: 13,
//                       height: 5,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.Border_COLOR),
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             topRight: Radius.circular(10),
//                             bottomRight: Radius.circular(10),
//                             bottomLeft: Radius.circular(10)),
//                       ),
//                       child: Table(
//                         columnWidths: {
//                           0: FlexColumnWidth(1),
//                           1: FlexColumnWidth(4),
//                           2: FlexColumnWidth(4),
//                         },
//                         border: TableBorder(
//                           horizontalInside: BorderSide(
//                               width: 1,
//                               color: AppColors.Border_COLOR,
//                               style: BorderStyle.solid),
//                           verticalInside: BorderSide(
//                               width: 1,
//                               color: AppColors.Border_COLOR,
//                               style: BorderStyle.solid),
//                         ),
//
//                         // border:
//                         //     TableBorder.all(color: AppColors.Border_COLOR),
//                         children: [
//                           TableRow(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                               ),
//                               color: AppColors.BG_Table_COLOR,
//                             ),
//                             children: [
//                               SizedBox(
//                                 height: 40,
//                                 child: Center(
//                                   child: Text(
//                                     "NO",
//                                     style: TextStyle(
//                                         fontSize: 13,
//                                         fontFamily: 'Tajawal',
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 40,
//                                 child: Center(
//                                   child: Text(
//                                     "المبلغ",
//                                     style: TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w500,
//                                         fontFamily: 'Tajawal',
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                               TableCell(
//                                 child: SizedBox(
//                                   height: 40,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.only(top: 10),
//                                           ),
//                                           StarRedCustom(
//                                             isHidden: true,
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         width: 2,
//                                       ),
//                                       Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.only(top: 10),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               "أدخل قيمة المبلغ النقدي",
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontSize: 13,
//                                                   fontWeight: FontWeight.w500,
//                                                   fontFamily: 'Tajawal',
//                                                   color: Colors.white),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           TableRow(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   bottomRight: Radius.circular(10),
//                                   bottomLeft: Radius.circular(10)),
//                               color: AppColors.bg_COLOR,
//                             ),
//                             children: [
//                               TableCell(
//                                 child: SizedBox(
//                                   height: 40,
//                                   child: Center(
//                                     child: Text(
//                                       "1",
//                                       style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w500,
//                                           fontFamily: 'Tajawal',
//                                           color: AppColors.Text_Table_COLOR),
//                                     ),
//                                   ),
//                                 ),
//                                 verticalAlignment:
//                                     TableCellVerticalAlignment.middle,
//                               ),
//                               TableCell(
//                                 child: Center(
//                                   child: Text(
//                                     "المبلغ",
//                                     style: TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w500,
//                                         fontFamily: 'Tajawal',
//                                         color: AppColors.Text_Table_COLOR),
//                                   ),
//                                 ),
//                                 verticalAlignment:
//                                     TableCellVerticalAlignment.middle,
//                               ),
//                               TableCell(
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return CalculateScreen();
//                                         }).then((value) {
//                                       // TODO: show error message if amount not correct
//                                       if (value == null) {
//                                       } else if (double.parse(value) >
//                                           (provider.getRemainingAmount() +
//                                               provider.monthList.cashAmount)) {
//                                         const snackBar = SnackBar(
//                                             backgroundColor: AppColors.Snack_Bar_COLOR,
//                                             content: Text(
//                                               'الراتب لا يتناسب مع مجموع المصاريف يرجى إما زيادة الراتب إو تقليل المصاريف',
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.w500,
//                                                   fontFamily: "Segoe UI"),
//                                             ));
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(snackBar);
//                                       } else {
//                                         provider.changeCashAmount(value);
//                                       }
//                                     });
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.only(
//                                           bottomLeft: Radius.circular(10)),
//                                     ),
//                                     child: Center(
//                                       child: Text(
//         NumberFormat('###,##0.00').format(provider.monthList.cashAmount
//                                             ),
//                                         style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Segoe UI",
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 verticalAlignment:
//                                     TableCellVerticalAlignment.middle,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Container(
//               //   padding: EdgeInsets.only(left: 16, right: 16),
//               //   child: Row(
//               //     children: [
//               //       GestureDetector(
//               //         onTap: () {
//               //           Navigator.pop(context);
//               //         },
//               //         child: Column(
//               //           children: [
//               //             SizedBox(
//               //               width: 29,
//               //               height: 43,
//               //               child: Icon(
//               //                 Icons.arrow_back,
//               //                 color: AppColors.MAIN_COLOR,
//               //                 size: 30.0,
//               //               ),
//               //             ),
//               //             // SizedBox(height: 5,),
//               //             Text(
//               //               "السابق",
//               //               style: TextStyle(
//               //                   color: AppColors.MAIN_COLOR,
//               //                   fontSize: 13,
//               //                   fontFamily: "Segoe UI",
//               //                   fontWeight: FontWeight.bold),
//               //             ),
//               //           ],
//               //         ),
//               //       ),
//               //       Spacer(),
//               //       GestureDetector(
//               //         onTap: () {
//               //           Navigator.pushReplacementNamed(
//               //               context, CardsScreen.routeName);
//               //         },
//               //         child: Column(
//               //           children: [
//               //             SizedBox(
//               //               child: Icon(
//               //                 Icons.arrow_forward,
//               //                 color: AppColors.MAIN_COLOR,
//               //                 size: 30.0,
//               //               ),
//               //               width: 29,
//               //               height: 43,
//               //             ),
//               //             Text(
//               //               "التالي",
//               //               style: TextStyle(
//               //                   color: AppColors.MAIN_COLOR,
//               //                   fontSize: 13,
//               //                   fontFamily: "Segoe UI",
//               //                   fontWeight: FontWeight.bold),
//               //             ),
//               //           ],
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               SizedBox(
//                 height: 15,
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
//
// class DecimalTextInputFormatter extends TextInputFormatter {
//   DecimalTextInputFormatter({this.decimalRange})
//       : assert(decimalRange == null || decimalRange > 0);
//
//   final int decimalRange;
//
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue, // unused.
//     TextEditingValue newValue,
//   ) {
//     TextSelection newSelection = newValue.selection;
//     String truncated = newValue.text;
//
//     if (decimalRange != null) {
//       String value = newValue.text;
//
//       if (value.contains(".") &&
//           value.substring(value.indexOf(".") + 1).length > decimalRange) {
//         truncated = oldValue.text;
//         newSelection = oldValue.selection;
//       } else if (value == ".") {
//         truncated = "0.";
//
//         newSelection = newValue.selection.copyWith(
//           baseOffset: math.min(truncated.length, truncated.length + 1),
//           extentOffset: math.min(truncated.length, truncated.length + 1),
//         );
//       }
//
//       return TextEditingValue(
//         text: truncated,
//         selection: newSelection,
//         composing: TextRange.empty,
//       );
//     }
//     return newValue;
//   }
// }
