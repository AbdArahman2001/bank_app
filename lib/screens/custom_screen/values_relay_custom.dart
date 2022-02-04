import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:flutter/material.dart';

class ValuesRelayCustom extends StatelessWidget {
  String text;

  ValuesRelayCustom(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 126,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: AppColors.Drawer_COLOR, spreadRadius: 1),
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