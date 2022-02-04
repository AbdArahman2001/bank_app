import 'package:flutter/material.dart';

class Numbers_Custom extends StatelessWidget {
  String text;
Function function;
  Numbers_Custom(this.text,this.function);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 52,
        height: 47,
        color: Colors.white,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: "Segoe UI",
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}
