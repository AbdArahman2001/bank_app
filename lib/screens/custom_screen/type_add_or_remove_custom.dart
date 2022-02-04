import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:flutter/material.dart';

class TypeAddOrRemoveCustom extends StatelessWidget {
  String text;

  TypeAddOrRemoveCustom(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 94,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: AppColors.Border_COLOR, spreadRadius: 1),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontFamily: "Segoe UI",
            fontWeight: FontWeight.w900,
            color: AppColors.MAIN_COLOR,
          ),
        ),
      ),
    );
  }
}
