import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  Function function;
  CustomButton({
    @required this.title,
    @required this.function,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 36,
      width: 114,
      // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.MAIN_COLOR),
         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
         // side: BorderSide(color: AppColors.Border_COLOR)
      )
    ),),
        // color: Colors.green,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Text(this.title,
        style: TextStyle(color: Colors.white,
        fontSize: 20,
        fontFamily: "Segoe UI",
        fontWeight: FontWeight.w600),),
        onPressed: function,
      ),
    );
  }
}
