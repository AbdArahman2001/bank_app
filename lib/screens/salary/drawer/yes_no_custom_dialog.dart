import 'package:bank_app_flutter/screens/custom_screen/close_button_custom.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { Yes, No }

class YesNoCustomDialog extends StatefulWidget {
  @override
  State<YesNoCustomDialog> createState() => _YesNoCustomDialogState();
}

class _YesNoCustomDialogState extends State<YesNoCustomDialog> {
  SingingCharacter _character = SingingCharacter.Yes;
  SingingCharacter _character1 = SingingCharacter.No;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 8, top: 3, right: 10),
        width: 343,
        height: 225,
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
                Text(
                  "- ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Segoe UI",
                    fontWeight: FontWeight.bold,
                    color: AppColors.Drawer_COLOR,
                  ),
                ),
                Text(
                  "هل تم إيداع مبلغ ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Segoe UI",
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "44.44",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Segoe UI",
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                Text(
                  " لبطاقة الراتب ؟",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Segoe UI",
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio<SingingCharacter>(
                        value: SingingCharacter.Yes,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() {
                            //context.setLocale(Locale('ar'));
                            _character = value;
                          });
                        }),
                    Text(
                      'نعم',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Segoe UI"),
                    ),
                  ],
                ),
                SizedBox(
                  width: 43,
                ),
                Row(
                  children: [
                    Radio<SingingCharacter>(
                        value: SingingCharacter.No,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() {
                            //context.setLocale(Locale('ar'));
                            _character = value;
                          });
                        }),
                    Text(
                      'لا',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Segoe UI"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "- هل تم تحويل مبلغ 44.40 من بطاقة الادخار لبطاقة الراتب؟",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Segoe UI",
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Radio<SingingCharacter>(
                        value: SingingCharacter.Yes,
                        groupValue: _character1,
                        onChanged: (SingingCharacter value) {
                          setState(() {
                            //context.setLocale(Locale('ar'));
                            _character1 = value;
                          });
                        }),
                    Text(
                      'نعم',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Segoe UI"),
                    ),
                  ],
                ),
                SizedBox(
                  width: 43,
                ),
                Row(
                  children: [
                    Radio<SingingCharacter>(
                        value: SingingCharacter.No,
                        groupValue: _character1,
                        onChanged: (SingingCharacter value) {
                          setState(() {
                            //context.setLocale(Locale('ar'));
                            _character1 = value;
                          });
                        }),
                    Text(
                      'لا',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Segoe UI"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
