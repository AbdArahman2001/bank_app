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
          height: 60,
          width: 60,
          child: Icon(
            Icons.cancel,
            color: Colors.red,
            size: 50,
          )
        // Image.asset("assets/images/check (1).png",color: Colors.green,))
      ),

    );
  }
}
