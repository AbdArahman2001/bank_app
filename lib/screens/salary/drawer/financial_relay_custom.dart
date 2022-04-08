import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/screens/custom_screen/calculate_screen.dart';
import 'package:bank_app_flutter/screens/custom_screen/close_button_custom.dart';
import 'package:bank_app_flutter/screens/custom_screen/star_red_custom.dart';
import 'package:bank_app_flutter/screens/custom_screen/values_relay_custom.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinancialRelayCustom extends StatefulWidget {
  @override
  State<FinancialRelayCustom> createState() => _FinancialRelayCustomState();
}

class _FinancialRelayCustomState extends State<FinancialRelayCustom> {
  HomeProvider provider;
  List<List<String>> expences = [];
  List<List<String>> _currencies = [
    ['0', 'Saver'.tr()],
  ];
  double _value = 0.0;
  int _fromCurrentItemSelected = 0;
  int _toCurrentItemSelected = 1;

  @override
  initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false)
        .monthList
        .expences
        .forEach((e) {
      expences.add([e.sirial.toString(), e.type]);
    });
    // expences = Provider.of<HomeProvider>(context,listen: false).monthList.expences.map((e) => [e.id,e.type]).toList();
    _currencies.addAll(expences);
    print("_currencies");
    _currencies.forEach((element) {print(element);});
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeProvider>(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.Drawer_COLOR),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 8, top: 8, right: 16),
        //width: 343,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Spacer(),
                CloseButtonCustom(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                            width: 5,
                          ),
                    Text(
                      "Deportation from:".tr(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                // StarRedCustom(
                //   isHidden: true,
                // ),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: 5,
                //     ),
                //     Text(
                //       "Deportation from:".tr(),
                //       textAlign: TextAlign.start,
                //       style: TextStyle(
                //         fontSize: 14,
                //         fontFamily: "Segoe UI",
                //         fontWeight: FontWeight.w600,
                //         color: Colors.black,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 38,
                  // width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: AppColors.Drawer_COLOR, spreadRadius: 1),
                    ],
                  ),
                  child: Center(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: AppColors.Back_Ground_COLOR,
                      ),
                      child: DropdownButton<String>(
                        items: _currencies
                            .where((element) =>
                                element[1] !=
                                _currencies[_toCurrentItemSelected][1])
                            .toList()
                            .asMap()
                            .map((i, List<String> dropDownStringItem) {
                              return MapEntry(
                                  i,
                                  DropdownMenuItem<String>(
                                    value: (i < _toCurrentItemSelected)
                                        ? i.toString()
                                        : (i + 1).toString(),
                                    child: Row(children: [
                                      Text("  "),
                                      Text(
                                        (dropDownStringItem[0]).toString().tr(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.Drawer_COLOR,
                                        ),
                                      ),
                                      Text(
                                        "-",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.Drawer_COLOR,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        dropDownStringItem[1].tr(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.Drawer_COLOR,
                                        ),
                                      ),
                                    ]),
                                  ));
                            })
                            .values
                            .toList(),
                        onChanged: (String newValueSelected) {
                          setState(() {
                            int parsed = int.tryParse(newValueSelected);
                            this._fromCurrentItemSelected =
                                parsed != null ? parsed : 0;
                            _value = 0;
                          });
                        },
                        value: _fromCurrentItemSelected.toString(),
                      ),
                    ),
                  ),
                ),

                ValuesRelayCustom(NumberFormat('###,##0.00').format(provider.getFromSelectedItemReminderAmount(
                            _fromCurrentItemSelected) -
                        _value)
                    ),

              ],
            ),
            SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CalculateScreen(0,"The value to be carried over".tr(),0,0,false);
                        }).then((value) {
                      if (value == null) {
                      } else if (double.parse(value) >
                          provider.getFromSelectedItemReminderAmount(
                              _fromCurrentItemSelected)) {
                        showDialog(
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      color: Color(0XFFC83E5B),
                                      child: Center(
                                        child: Text(
                                          'vailable for a relay'.tr(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Segoe UI"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                        // const snackBar = SnackBar(
                        //     backgroundColor: Colors.redAccent,
                        //     content: Text(
                        //       'القيمة المدخلة أكبر من القيمة المتاحة للترحيل',
                        //       textAlign: TextAlign.center,
                        //       style: TextStyle(
                        //           fontSize: 20,
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.w500,
                        //           fontFamily: "Segoe UI"),
                        //     ));
                        // ScaffoldMessenger.of(context)
                        //     .showSnackBar(snackBar);
                      } else {
                        setState(() {
                          _value = double.parse(value);
                        });
                      }
                    });
                  },
                  child: Row(
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
                            _value == 0
                                ?  "Enter the value + ".tr()
                                : NumberFormat('###,##0.00').format(_value),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w900,
                              color: _value == 0 ? Colors.red : AppColors.MAIN_COLOR,
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
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Deportation to:".tr(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Segoe UI",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: AppColors.Drawer_COLOR, spreadRadius: 1),
                    ],
                  ),
                  child: Center(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: AppColors.Back_Ground_COLOR,
                      ),
                      child: DropdownButton<String>(

                        items: _currencies
                            .where((element) =>
                                element !=
                                _currencies[_fromCurrentItemSelected])
                            .toList()
                            .asMap()
                            .map((i, List<String> dropDownStringItem) {
                              return MapEntry(
                                  i,
                                  DropdownMenuItem<String>(
                                    value: (i < _fromCurrentItemSelected)
                                        ? i.toString()
                                        : (i + 1).toString(),
                                    child: Row(children: [
                                      Text("  "),
                                      Text(
                                        (dropDownStringItem[0]).toString().tr(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.Drawer_COLOR,
                                        ),
                                      ),
                                      Text(
                                        "-",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.Drawer_COLOR,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        dropDownStringItem[1].tr(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.Drawer_COLOR,
                                        ),
                                      ),
                                    ]),
                                  ));
                            })
                            .values
                            .toList(),
                        onChanged: (String newValueSelected) {
                          setState(() {
                            int parsed = int.tryParse(newValueSelected);
                            this._toCurrentItemSelected =
                                parsed != null ? parsed : 0;
                          });
                        },
                        value: _toCurrentItemSelected.toString(),
                      ),
                    ),
                  ),
                ),
                ValuesRelayCustom(NumberFormat('###,##0.00').format(provider.getFromSelectedItemReminderAmount(
                            _toCurrentItemSelected) +
                        _value)),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    provider.transfareAmount(_fromCurrentItemSelected,
                        _toCurrentItemSelected, _value);
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green,
                        // image: DecorationImage(
                        //   image: AssetImage("assets/images/okk.png"),
                        // ),
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 50,
                      )
                    // Image.asset("assets/images/check (1).png",color: Colors.green,))
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
