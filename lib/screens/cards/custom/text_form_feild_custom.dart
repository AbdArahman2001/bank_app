import 'package:flutter/material.dart';

import '../../../utlies/app_colors.dart';

class TextFormFeildCustom extends StatelessWidget {
  String texthint;
  TextEditingController controller;
  TextInputType textInputType;
  TextInputAction textInputAction;
  Widget icon;

  TextFormFeildCustom({
    this.texthint,
    this.controller,
    this.textInputAction,
    this.textInputType,
    this.icon
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontFamily: "ExpoArabic",
          fontSize: 14.0,
        ),
        textInputAction: textInputAction,
        keyboardType: textInputType,
        validator: (v) => (v),
        // onSaved: (v) => save(v),
        obscureText: false,
        //  controller: this.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: AppColors.Border_COLOR,
            ),
          ),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          //   borderSide: BorderSide(width: 2, color: Colors.white),
          // ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: AppColors.Border_COLOR),
            // borderRadius: BorderRadius.circular(15),
          ),
          suffixIcon : icon,
          labelText: texthint,
          labelStyle: TextStyle(
            color: Colors.black.withOpacity(0.46),
            fontWeight: FontWeight.w400,
            fontFamily: "Segoe UI",
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
