import 'package:flutter/material.dart';


class CloseButtonCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage("assets/images/close.png"),
    ),
    ),
      ),
    );
  }
}
