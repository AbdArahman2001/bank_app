import 'package:bank_app_flutter/model/HiveData.dart';
import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/screens/cards/monthly_income_screen.dart';
import 'package:bank_app_flutter/screens/custom_screen/all_numbers_custom.dart';
import 'package:bank_app_flutter/screens/custom_screen/close_button_custom.dart';
import 'package:bank_app_flutter/screens/custom_screen/custom_button.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
class CalculateScreen extends StatefulWidget {
  String type;
  double amount;
  double rmain;
  bool isRmain;

  CalculateScreen(String t, double a, double r,bool ir){
    type = t;
    amount = a;
    rmain = r;
    isRmain = ir;
  }
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

    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      elevation: 0.0,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.Border_COLOR ),
            borderRadius: BorderRadius.circular(20),
            color: AppColors.bg_COLOR,
          ),
          // padding: EdgeInsets.only(top: 16, bottom: 8,left: 4,right: 4),
          width: MediaQuery.of(context).size.width,
          // width: 272,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 5,),
                  Container(
                    width: 78,
                    height: 47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  widget.isRmain? Colors.white : Colors.transparent,

                    ),
                    child: Visibility(
                      visible: widget.isRmain,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "Remaining".tr(),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Segoe UI",
                                  color: Colors.black),
                            ),
                            Text(
                              NumberFormat('###,##0.00').format(widget.rmain - double.parse(provider.result)),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Segoe UI",
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Directionality(
                      textDirection: ui.TextDirection.ltr,
                      child: Container(
                        // height: 36,
                        height: 32,
                        // width: 200,
                        child: Center(
                          child: Text(
                            "${widget.type}",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.MAIN_COLOR,
                          boxShadow: [
                            BoxShadow(color: Colors.white, spreadRadius: 1),
                         //color: AppColors.Border_COLOR
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  CloseButtonCustom(),
                  SizedBox(width: 12,),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  // SizedBox(width: 48,),
                  Expanded(
                    child: Directionality(
                      textDirection: ui.TextDirection.ltr,
                      child: Container(
                        // height: 36,
                        height: 38,
                        // width: 200,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                " ${provider.result} " + "Total".tr(),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.MAIN_COLOR,
                                ),),
                              Text(
                                provider.equation,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.Border1_COLOR,
                                  // color: AppColors.MAIN_COLOR,
                                ),),
                            ],
                          ),
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
                  ),
                  // SizedBox(width: 48,),

                ],
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                // width: 171,
                width: MediaQuery.of(context).size.width,
                height: 135,
                child: AllNumbersCustom(),
              ),
              SizedBox(
                height: 8,
              ),
              // Spacer(),
              CustomButton(
                 function: () {
                   text = provider.result;
                   provider.clearNumber();
                   Navigator.pop(context,text);
                 },
                title: "ADD".tr(),
              ),
              // SizedBox(height: 8,),
            ],
          ),
        )],
      ),
    );
  }
}


/// dialog ///
/// import 'package:bank_app_flutter/providers/home_provider.dart';
// import 'package:bank_app_flutter/screens/cards/monthly_income_screen.dart';
// import 'package:bank_app_flutter/screens/custom_screen/all_numbers_custom.dart';
// import 'package:bank_app_flutter/screens/custom_screen/close_button_custom.dart';
// import 'package:bank_app_flutter/screens/custom_screen/custom_button.dart';
// import 'package:bank_app_flutter/utlies/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class CalculateScreen extends StatefulWidget {
//   @override
//   State<CalculateScreen> createState() => _CalculateScreenState();
// }
// class _CalculateScreenState extends State<CalculateScreen> {
//   HomeProvider provider;
// String text;
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     provider.result = "0";
//   }
//   @override
//   Widget build(BuildContext context) {
//     provider = Provider.of<HomeProvider>(context);
//
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.Border_COLOR ),
//           borderRadius: BorderRadius.circular(20),
//           color: AppColors.bg_COLOR,
//         ),
//         padding: EdgeInsets.only(top: 16, bottom: 8,left: 4,right: 4),
//         width: MediaQuery.of(context).size.width - 10,
//         // width: 272,
//         height: 400,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 SizedBox(width: 48,),
//                 Directionality(
//                   textDirection: TextDirection.ltr,
//                   child: Expanded(
//                     child: Container(
//                       // height: 36,
//                       height: 32,
//                       // width: 200,
//                       child: Center(
//                         child: Text(
//                           "اسم البند",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontFamily: "Segoe UI",
//                             fontWeight: FontWeight.w900,
//                             color: Colors.white,
//                           ),),
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: AppColors.MAIN_COLOR,
//                         boxShadow: [
//                           BoxShadow(color: Colors.white, spreadRadius: 1),
//                        //color: AppColors.Border_COLOR
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16,),
//                 CloseButtonCustom(),
//                 SizedBox(width: 12,),
//               ],
//             ),
//             SizedBox(height: 8,),
//             Row(
//               children: [
//                 SizedBox(width: 48,),
//                 Directionality(
//                   textDirection: TextDirection.ltr,
//                   child: Expanded(
//                     child: Container(
//                       // height: 36,
//                       height: 52,
//                       // width: 200,
//                       child: Center(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "المجموع 300",
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontFamily: "Segoe UI",
//                                 fontWeight: FontWeight.w900,
//                                 color: AppColors.MAIN_COLOR,
//                               ),),
//                             Text(
//                               provider.getClacResult(),
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontFamily: "Segoe UI",
//                                 fontWeight: FontWeight.w900,
//                                 color: AppColors.Border1_COLOR,
//                                 // color: AppColors.MAIN_COLOR,
//                               ),),
//                           ],
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(color: AppColors.Border_COLOR, spreadRadius: 1),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 48,),
//
//               ],
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             SizedBox(
//               // width: 171,
//               width: MediaQuery.of(context).size.width,
//               height: 212,
//               child: AllNumbersCustom(),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             // Spacer(),
//             CustomButton(
//                function: () {
//                  text = provider.result;
//                  provider.clearNumber();
//                  Navigator.pop(context,text);
//                },
//               title: "ADD",
//             ),
//             // SizedBox(height: 8,),
//           ],
//         ),
//       ),
//     );
//   }
// }