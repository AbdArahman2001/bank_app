import '../../../utlies/app_colors.dart';
import 'package:flutter/material.dart';

class TitleDrawerCustom extends StatelessWidget {
  final String text;
 final Image imageicon;
  final Function function;

   TitleDrawerCustom({
    this.text,
    this.imageicon,
     this.function
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> function(),
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(10),
          color: AppColors.App_Bar_COLOR,
        ),
        child: ListTile(
          // onTap: () {
          //   function();
          // },
          leading:SizedBox(
            height: 26,
            width: 25,
            child:  imageicon,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontFamily: "Segoe UI",
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: AppColors.MAIN_COLOR,
            ),
          ),

        ),
      ),
    );
  }
}
