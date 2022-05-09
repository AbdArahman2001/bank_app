import 'package:flutter/material.dart';


class CloseButtonCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child:
      // Container(
      //   // padding: EdgeInsets.only(right: 60,left: 60),
      //   child: Icon(
      //     Icons.cancel,
      //     color: Colors.red,
      //     size: 40,
      //   ),
      // ),
      Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.red,
          // image: DecorationImage(
          //   image: AssetImage("assets/images/okk.png"),
          // ),
        ),
        // padding: EdgeInsets.only(right: 60,left: 60),
        child: Icon(
          Icons.clear,
          color: Colors.white,
          size: 22,
        ),
      ),

    );
  }
}
