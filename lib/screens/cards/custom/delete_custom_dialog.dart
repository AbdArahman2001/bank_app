import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class DeleteCustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(left: 37, right: 37),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.Border_COLOR),
          // borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        width: 343,
        height: 224,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/delete_black.png"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Center(
              child: Text(
                "Do you want to continue the deletion process?".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SizedBox(
                  height: 36,
                  width: 114,
                  // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.MAIN_COLOR),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "Cancle".tr(),
                        style: TextStyle(
                            color: AppColors.MAIN_COLOR,
                            fontSize: 22,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.pop(context,false);

                      }),
                ),
                SizedBox(
                  height: 36,
                  width: 114,
                  // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: RaisedButton(
                    color: AppColors.MAIN_COLOR,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Delete".tr(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      Navigator.pop(context,true);
                    },
                  ),
                ),
              ],
            ),
            // SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
