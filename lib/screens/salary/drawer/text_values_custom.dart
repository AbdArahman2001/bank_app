import '../../../providers/home_provider.dart';
import '../../../screens/custom_screen/calculate_screen.dart';
import '../../../utlies/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextValuesCustom extends StatelessWidget {
  String text;
  String nameCard;
  String money;
Function function;

  TextValuesCustom({this.text, this.nameCard,this.money,this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Text(
            "- ",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: "Segoe UI",
                color: AppColors.Drawer_COLOR),
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: "Segoe UI"),
          ),
          Text(
            nameCard,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: "Segoe UI"),
          ),
          Spacer(),
          GestureDetector(
            onTap: function,
            child: Container(
              child: Center(
                child: Text(
                  money,
                  // provider.availbeSalary.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: "Segoe UI",
                    fontWeight: FontWeight.w900,
                    color: AppColors.MAIN_COLOR,
                  ),
                ),
              ),
              height: 25,
              width: 74,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: AppColors.Border_COLOR, spreadRadius: 1),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 36,
          )
        ],
      );

  }
}
