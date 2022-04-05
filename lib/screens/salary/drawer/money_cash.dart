import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/screens/custom_screen/calculate_screen.dart';
import 'package:bank_app_flutter/screens/custom_screen/close_button_custom.dart';
import 'package:bank_app_flutter/screens/salary/drawer/text_values_custom.dart';
import 'package:bank_app_flutter/screens/salary/following_the_rules_screen.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:provider/provider.dart';

class MoneyCashDialog extends StatefulWidget {
  @override
  _MoneyCashDialogState createState() => _MoneyCashDialogState();
}

class _MoneyCashDialogState extends State<MoneyCashDialog> {
  List<String> expences;

  List<String> _currencies = ['Saver'.tr(),];
  double _addedValue = 0.0;
  int _currentItemSelected1 = 0;
  double _value = 0.0;
  @override
  initState(){
    super.initState();
    expences = Provider.of<HomeProvider>(context,listen: false).monthList.expences.map((e) => e.type).toList();
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
          padding: EdgeInsets.only(left: 8, top: 8,right: 16),
          width: 343,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Spacer(),
                  CloseButtonCustom(),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(
                      color: AppColors.Drawer_COLOR,
                      image: AssetImage(
                        'assets/images/add-money.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      "Please add the additional amount".tr(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 16,
              ),

              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CalculateScreen("مبلغ إضافي",0,0,false);
                      }).then((value) {
                    _addedValue = double.parse(value);
                    // provider.availbeCash = double.parse(value);
                    provider.notifyListeners();
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                      width: 148,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.Drawer_COLOR, spreadRadius: 1),
                        ],
                      ),
                      child: Center(
                        child:  Text(
                          _addedValue == 0
                              ?  "أدخل القيمة".tr()
                              : NumberFormat('###,##0.00').format(_addedValue),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w900,
                            color: _addedValue == 0 ? Colors.red : AppColors.MAIN_COLOR,
                          ),
                        ),
                        // Text(
                        //   _value == 0
                        //       ? "Example: Enter the phase value".tr()
                        //       : NumberFormat('###,##0.00').format(_value),
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     fontSize: 13,
                        //     fontFamily: "Segoe UI",
                        //     fontWeight: FontWeight.w900,
                        //     color: AppColors.MAIN_COLOR,
                        //   ),
                        // ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/addadd.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Expanded(
                //       child: Container(
                //         margin: EdgeInsets.only(left: 10,right: 60),
                //         child: Center(
                //           child: Text(
                //             _value == 0
                //                 ?  "أدخل القيمة".tr()
                //                 : NumberFormat('###,##0.00').format(_value),
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //               fontSize: 13,
                //               fontFamily: "Segoe UI",
                //               fontWeight: FontWeight.w900,
                //               color: _value == 0.0 ? Colors.red : AppColors.MAIN_COLOR,
                //             ),
                //           ),
                //         ),
                //         height: 35,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8),
                //           color: Colors.white,
                //           boxShadow: [
                //             BoxShadow(
                //                 color: AppColors.MAIN_COLOR, spreadRadius: 1),
                //           ],
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: 30,
                //       width: 30,
                //       decoration: BoxDecoration(
                //         image: DecorationImage(
                //           image: AssetImage(
                //               "assets/images/addadd.png"),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Please select the item to which the amount will be credited:".tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    margin: EdgeInsets.only(left: 60,right: 60),
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.Drawer_COLOR, spreadRadius: 1),
                      ],
                    ),
                    child: Center(
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: AppColors.Back_Ground_COLOR,
                        ),
                        child: DropdownButton<String>(
                          items: _currencies.asMap().map((i,String dropDownStringItem) {
                            return MapEntry(i,DropdownMenuItem<String>(
                              value: i.toString(),
                              child: Row(
                                  children: [
                                    Text((i < 1 ? 0 : i).toString(),style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Segoe UI",
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.Drawer_COLOR,
                                    ),
                                    ),
                                    Text("-",style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Segoe UI",
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.Drawer_COLOR,
                                    ),
                                    ),
                                    SizedBox(width: 5,),
                                    Text(dropDownStringItem,style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Segoe UI",
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.Drawer_COLOR,
                                    ),
                                    ),
                                  ]
                              ),
                            ));
                          }).values.toList(),
                          onChanged: (String newValueSelected) {
                            setState(() {
                              int parsed = int.tryParse(newValueSelected);
                              this._currentItemSelected1 = parsed != null ? parsed : 0;
                            });
                          },
                          value: _currentItemSelected1.toString(),

                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  provider.addAdditionalValue(_addedValue,_currentItemSelected1);
                  Navigator.pop(context);
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/okk.png"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      );
    });
  }
}
