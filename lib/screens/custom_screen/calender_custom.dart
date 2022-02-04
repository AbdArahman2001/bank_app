import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'close_button_custom.dart';

class CalenderCustom extends StatefulWidget {
  @override
  _CalenderCustomState createState() => _CalenderCustomState();
}

class _CalenderCustomState extends State<CalenderCustom> {
  String formattedDate;
  HomeProvider provider;
  @override
  Widget build(BuildContext context) {
    // DateTime salaryDate = Provider.of<HomeProvider>(context).monthList.salaryDate;
    // salaryDate = salaryDate == null ? DateTime.now() : salaryDate;
    // final date2 = DateTime.now();
    //TODO: get the difference
    // final difference = daysBetween(DateTime.now(), DateTime.now());
    // print(difference);
    provider = Provider.of<HomeProvider>(context);
    // formattedDate = provider.monthList.salaryDate == null? DateTime.now() : provider.monthList.salaryDate;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
        // border: Border.all(color: AppColors.Border_COLOR),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
         padding: EdgeInsets.only(left: 15, right: 15),
        width: 300,
        height: 160,
        child: GestureDetector(
          onTap: () {
            provider.setDate(context);
          },
          child: Column(
            children: [
              SizedBox(height: 5,),
              Row(
                children: [
                  Spacer(),
                  CloseButtonCustom(),
                ],
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () async {
                  provider.setDate(context);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: AppColors.MAIN_COLOR, spreadRadius: 1),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                    Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                            size: 21,
                          ),
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
                            fontFamily: "Segoe UI"),
                      ),
                      SizedBox(
                        width: 20,
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.MAIN_COLOR,
                        spreadRadius: 1),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      provider.getReminderDate(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Segoe UI",
                        color: AppColors.Drawer_COLOR,
                      ),
                    ),
                    SizedBox(width: 2,),
                    Text(
                      "Day".tr(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Segoe UI",
                        color: AppColors.Drawer_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
  int daysBetween(DateTime from, DateTime to) {
    DateTime now = DateTime.now();
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
