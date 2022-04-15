import 'package:flutter/material.dart';


class CloseButtonCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child:
      Container(
        // padding: EdgeInsets.only(right: 60,left: 60),
        child: Icon(
          Icons.cancel,
          color: Colors.red,
          size: 40,
        ),
      ),

    );
  }
}
