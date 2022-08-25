import '../../../providers/home_provider.dart';
import '../../../screens/custom_screen/calculate_screen.dart';
import '../../../screens/custom_screen/close_button_custom.dart';
import '../../../screens/salary/drawer/text_values_custom.dart';
import '../../../screens/salary/following_the_rules_screen.dart';
import '../../../utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:provider/provider.dart';

class StatisticsDialog extends StatefulWidget {
  @override
  _StatisticsDialogDialogState createState() => _StatisticsDialogDialogState();
}

class _StatisticsDialogDialogState extends State<StatisticsDialog> {
  List<String> expences;

  List<String> _currencies = ['Saver'.tr(), 'Cash amount'.tr()];
  double _addedValue = 0.0;
  int _currentItemSelected1 = 0;

  @override
  initState() {
    super.initState();
    expences = Provider.of<HomeProvider>(context, listen: false)
        .monthList
        .expences
        .map((e) => e.type)
        .toList();
    _currencies.addAll(expences);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, x) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.Drawer_COLOR),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: 8, top: 8, right: 16),
          width: 343,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Spacer(),
                  CloseButtonCustom(),
                ],
              ),

              Text(
                "Statistic".tr(),
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 8),
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(4),
                    1: FlexColumnWidth(4),
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
                          child: Center(
                            child: Text(
                              "Item".tr(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Tajawal',
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        TableCell(
                          child:  SizedBox(
                            height: 40,
                            child: Center(
                              child: Text(
                                "Remaining".tr(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Tajawal',
                                    color: Colors.white),
                              ),
                            ),
                          ),),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.only(
                        //     bottomRight: Radius.circular(10),
                        //     bottomLeft: Radius.circular(10)),
                        color: AppColors.bg_COLOR,
                      ),
                      children: [
                        SizedBox(
                          height: 40,
                          child: Center(
                            child: Text(
                              "Saver".tr(),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Tajawal',
                                  color: Colors.black),
                            ),
                          ),
                          // verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: SizedBox(
                            height: 40,
                            child: Center(
                              child: Text(
                                NumberFormat('###,##0.00').format(provider.monthList.saveAmount - provider.monthList.totalSave)
                                  ,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Segoe UI",
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ],
                    ),
                      TableRow(
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.only(
                          //     bottomRight: Radius.circular(10),
                          //     bottomLeft: Radius.circular(10)),
                          color: AppColors.bg_COLOR,
                        ),
                        children: [
                          SizedBox(
                            height: 40,
                            child: Center(
                              child: Text(
                                "The expenses".tr(),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Tajawal',
                                    color: Colors.black),
                              ),
                            ),
                            // verticalAlignment: TableCellVerticalAlignment.middle,
                          ),
                          TableCell(
                            child: SizedBox(
                              height: 40,
                              child: Center(
                                child: Text(
                                  NumberFormat('###,##0.00').format(provider.monthList.sumExpencesAmount - provider.monthList.sumTotalExpences)
                                      ,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Segoe UI",
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            verticalAlignment: TableCellVerticalAlignment.middle,
                          ),
                        ],
                      ),

                    // TableRow(
                    //   decoration: BoxDecoration(
                    //     // borderRadius: BorderRadius.only(
                    //     //     bottomRight: Radius.circular(10),
                    //     //     bottomLeft: Radius.circular(10)),
                    //     color: AppColors.bg_COLOR,
                    //   ),
                    //   children: [
                    //     SizedBox(
                    //       height: 40,
                    //       child: Center(
                    //         child: Text(
                    //           "The amount".tr(),
                    //           style: TextStyle(
                    //               fontSize: 15,
                    //               fontWeight: FontWeight.w500,
                    //               fontFamily: 'Tajawal',
                    //               color: Colors.black),
                    //         ),
                    //       ),
                    //       // verticalAlignment: TableCellVerticalAlignment.middle,
                    //     ),
                    //     TableCell(
                    //       child: SizedBox(
                    //         height: 40,
                    //         child: Center(
                    //           child: Text(
                    //             NumberFormat('###,##0.00').format(provider.monthList.cashAmount - provider.monthList.totalCash)
                    //                ,
                    //             style: TextStyle(
                    //               fontSize: 15,
                    //               fontWeight: FontWeight.w400,
                    //               fontFamily: "Segoe UI",
                    //               color: Colors.black,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       verticalAlignment: TableCellVerticalAlignment.middle,
                    //     ),
                    //   ],
                    // ),

                    TableRow(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                         bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: AppColors.BG_Table_COLOR,
                      ),
                      children: [
                        SizedBox(
                          height: 40,
                          child: Center(
                            child: Text(
                              "Grand total".tr(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Tajawal',
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        TableCell(
                          child: SizedBox(
                            height: 40,
                            child: Center(
                              child: Text(
                                NumberFormat('###,##0.00').format((provider.monthList.saveAmount - provider.monthList.totalSave) +
                                    (provider.monthList.sumExpencesAmount - provider.monthList.sumTotalExpences) +
                                    (provider.monthList.cashAmount - provider.monthList.totalCash))
                                    ,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Tajawal',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      );
    });
  }
}
