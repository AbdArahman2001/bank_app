import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/screens/custom_screen/numbers_custom.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllNumbersCustom extends StatelessWidget {
  HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeProvider>(context);
    String text;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Numbers_Custom(
                                    "1", () => provider.setNumber("1"))),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Numbers_Custom(
                                    "2", () => provider.setNumber("2"))),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Numbers_Custom(
                                    "3", () => provider.setNumber("3"))),
                            SizedBox(
                              width: 5,
                            ),

                            /// = /// ///
                            // Expanded(
                            //     child: Numbers_Custom("=", () => provider.evalEquation())),
                            // SizedBox(
                            //   width: 5,
                            // ),
                            /// /// ///
                            // Container(
                            //   width: 78,
                            //   height: 47,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     color: Colors.white,
                            //
                            //   ),
                            //   child: Center(
                            //     child: Column(
                            //       children: [
                            //         Text(
                            //           "المتبقي",
                            //           style: TextStyle(
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.bold,
                            //               fontFamily: "Segoe UI",
                            //               color: Colors.black),
                            //         ),
                            //         Text(
                            //           "200",
                            //           style: TextStyle(
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.w500,
                            //               fontFamily: "Segoe UI",
                            //               color: Colors.black),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Numbers_Custom(
                                    "4", () => provider.setNumber("4"))),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Numbers_Custom(
                                    "5", () => provider.setNumber("5"))),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Numbers_Custom(
                                    "6", () => provider.setNumber("6"))),
                            SizedBox(
                              width: 5,
                            ),

                            /// + /// ///
                            // Expanded(child: Numbers_Custom("+", () => provider.addOp("+"))),
                            // SizedBox(
                            //   width: 5,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Column(
                    children: [
                       Expanded(child: Numbers_Custom("+ \n \n ${"Sum".tr()}", () => provider.addOp("+"))),

                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Numbers_Custom(
                              "7", () => provider.setNumber("7"))),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Numbers_Custom(
                              "8", () => provider.setNumber("8"))),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Numbers_Custom(
                              "9", () => provider.setNumber("9"))),
                      SizedBox(
                        width: 5,
                      ),
                      // Expanded(child: Numbers_Custom("-", () => provider.addOp("-"))),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            provider.clearOnesNumber();
                          },
                          child: Container(
                            // width: 78,
                            // height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/clearones.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Numbers_Custom(
                              ".", () => provider.setNumber("."))),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Numbers_Custom(
                              "0", () => provider.setNumber("0"))),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Numbers_Custom(
                              "C", () => provider.clearNumber())),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          text = provider.result;
                          provider.clearNumber();
                          Navigator.pop(context, text);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.MAIN_COLOR,
                          ),
                          // width: 78,
                          // height: 65,
                          // color: Colors.white,
                          child: Center(
                            child: Text(
                              "ADD".tr(),
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Segoe UI",
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )

                          /// /// ///
                          // GestureDetector(
                          // onTap: () {
                          // text = provider.result;
                          // provider.clearNumber();
                          // Navigator.pop(context, text);
                          // },
                          // child:
                          // Container(
                          // // width: 78,
                          // // height: 65,
                          // child:
                          // Text("ADD".tr()),
                          // decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(10),
                          // color: Colors.white,
                          // // image: DecorationImage(
                          // //   image: AssetImage("assets/images/clearones.png"),
                          // // ),
                          // ),
                          // ),
                          // ),
                          ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
