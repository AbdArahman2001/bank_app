import '../../../providers/home_provider.dart';
import '../../../screens/custom_screen/calculate_screen.dart';
import '../../../screens/custom_screen/close_button_custom.dart';
import '../../../screens/salary/drawer/text_values_custom.dart';
import '../../../screens/salary/following_the_rules_screen.dart';
import '../../../utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinancialStatusUpdateDialog extends StatefulWidget {
  @override
  _FinancialStatusUpdateDialogState createState() =>
      _FinancialStatusUpdateDialogState();
}

class _FinancialStatusUpdateDialogState
    extends State<FinancialStatusUpdateDialog> {
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
          padding: EdgeInsets.only(left: 8, top: 3, right: 4),
          width: 343,
          height: 315,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Spacer(),
                  CloseButtonCustom(),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.info,
                      color: AppColors.Drawer_COLOR,
                      size: 24,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      "الرجاء إدخال المبالغ المتواجدة بالبطائق المضافة واتباع تعليمات التطبيق لتحقيق التوازن المالي",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              TextValuesCustom(
                text: "أدخل القيمة المتاحة ببطاقة ",
                nameCard: "الراتب",
                function:  () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CalculateScreen(0,"text",0,0,true,"");
                      }).then((value) {
                    provider.monthList.salaryAmount = double.parse(value);
                    provider.notifyListeners();
                  });
                },
                money: NumberFormat('###,##0.00').format(provider.monthList.salaryAmount),
              ),
              SizedBox(
                height: 8,
              ),
              TextValuesCustom(
                text: "أدخل القيمة المتاحة ببطاقة ",
                nameCard: "الادخار",
                function:  () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CalculateScreen(0,"text",0,0,true,"");
                      }).then((value) {
                    provider.monthList.saveAmount = double.parse(value);
                    provider.notifyListeners();
                  });
                },
                money: NumberFormat('###,##0.00').format(provider.monthList.saveAmount),
              ),
              SizedBox(
                height: 8,
              ),
              TextValuesCustom(
                text: "أدخل قيمة الحد الائتماني المتاح ببطاقة ",
                nameCard: "فيزا",
                function:  () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CalculateScreen(0,"text",0,0,true,"");
                      }).then((value) {
                    provider.aVisaLimit1 = double.parse(value);
                    provider.notifyListeners();
                  });
                },
                money: NumberFormat('###,##0.00').format(provider.aVisaLimit1),
              ),
              SizedBox(
                height: 8,
              ),
              TextValuesCustom(
                function:  () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CalculateScreen(0,"text",0,0,true,"");
                      }).then((value) {
                    provider.aVisaLimit2 = double.parse(value);
                    provider.notifyListeners();
                  });
                },
                money: NumberFormat('###,##0.00').format(provider.aVisaLimit2),
                text: "أدخل قيمة الحد الائتماني المتاح ببطاقة ",
                nameCard: "فيزا",
              ),
              SizedBox(
                height: 8,
              ),
              TextValuesCustom(
                text: "أدخل المبلغ النقدي المتاح",
                nameCard: " ",
                function:  () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CalculateScreen(0,"text",0,0,true,"");
                      }).then((value) {
                    provider.availbeCash = double.parse(value);
                    provider.notifyListeners();
                  });
                },
                money: NumberFormat('###,##0.00').format(provider.availbeCash),
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FollowingTheRulesScreen()),
                  );
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
                height: 10,
              ),
            ],
          ),
        ),
      );
    });
  }
}
