import 'dart:ui' as ui;

import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/screens/custom_screen/all_numbers_custom.dart';
import 'package:bank_app_flutter/screens/custom_screen/close_button_custom.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculateScreen extends StatefulWidget {
  String index;
  String type;
  double amount;
  double rmain;
  bool isRmain;

  CalculateScreen(int i, String t, double a, double r, bool ir) {
    index = i == 0 ? "" : "${i}- ";
    type = t != null && t != "" ? t : "اسم البند".tr();
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
    provider.equation = "0";
    provider.tNumber = "0";
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeProvider>(context);

    return Container(
      // backgroundColor: Colors.transparent,
      // // contentPadding: EdgeInsets.zero,
      // elevation: 0.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.45,
            // width: 400,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.Border_COLOR),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: AppColors.bg_COLOR,
            ),
            // padding: EdgeInsets.only(top: 16, bottom: 8,left: 4,right: 4),
            //  width: MediaQuery.of(context).size.width,
            // height: MediaQuery
            //     .of(context)
            //     .size
            //     .height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          // color: Colors.red,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // color: Colors.green,
                        ),
                      ),
                      CloseButtonCustom(),
                    ],
                  ),
                ),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: Container(
                    child: Center(
                      child: Directionality(
                        textDirection: context.locale == Locale('ar')
                            ? ui.TextDirection.rtl
                            : ui.TextDirection.ltr,
                        child: Text(
                          "${widget.index} ${widget.type}",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    height: 32,
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.MAIN_COLOR,
                      boxShadow: [
                        BoxShadow(color: Colors.white, spreadRadius: 1),
                        //color: AppColors.Border_COLOR
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.isRmain,
                  child: Container(
                    height: 32,
                    margin:
                        EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.bg1_COLOR,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.Border_COLOR, spreadRadius: 1),
                        //color: AppColors.Border_COLOR
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Remaining".tr() +
                              " " +
                              NumberFormat('###,##0.00').format(
                                  widget.rmain - double.parse(provider.result)),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              fontFamily: "Segoe UI",
                              color: (widget.rmain -
                                          double.parse(provider.result)) <
                                      0
                                  ? Colors.red
                                  : Colors.black),
                        ),
                        // Text(
                        //   " ",
                        //   style: TextStyle(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.w900,
                        //       fontFamily: "Segoe UI",
                        //       color: Colors.black),
                        // ),
                        // Text(
                        //   " ",
                        //   style: TextStyle(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.w900,
                        //       fontFamily: "Segoe UI",
                        //       color: Colors.black),
                        // ),
                      ],
                    ),
                  ),
                ),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: Container(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " ${NumberFormat('###,##0.00').format(double.parse(provider.result))} " +
                                "Expenses".tr(),
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w900,
                              color: AppColors.MAIN_COLOR,
                            ),
                          ),
                          Text( formatedEquation(),
                            
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w900,
                              color: AppColors.Border1_COLOR,
                              // color: AppColors.MAIN_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ),
                    height: 55,
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.Border_COLOR, spreadRadius: 1),
                      ],
                    ),
                  ),
                ),
                // Spacer(),
                SizedBox(
                  height: 10,
                ),

                Expanded(child: Container(child: AllNumbersCustom())),
                // SizedBox(
                //   height: 8,
                // ),
                // SizedBox(height: 10,),

                // CustomButton(
                //   function: () {
                //     text = provider.result;
                //     provider.clearNumber();
                //     Navigator.pop(context, text);
                //   },
                //   title: "ADD".tr(),
                // ),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  formatedEquation() {
    var last = provider.equation[provider.equation.length - 1];
    var splitted = provider.equation.split('+');
    String result = "";
    int count = 0;
    splitted.forEach((element) {
      print(" element || ${element}");
      var dotSplit = element.split(".");
      print("split || ${dotSplit.length}");
      if(!( element.contains(".") && dotSplit.length > 1 && dotSplit[1] == "")) {
        if (count < splitted.length - 1) {
          result +=
              NumberFormat('###,##0.00').format(double.parse(element)) + "+";
        } else if (element != "") {
          result += NumberFormat('###,##0.00').format(double.parse(element));
        }
      }else{
        result += element;
      }
      count++;
    });
    return result;
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
//               title: "ADD".tr(),
//             ),
//             // SizedBox(height: 8,),
//           ],
//         ),
//       ),
//     );
//   }
// }
