
import 'package:flutter/material.dart';

class StarRedCustom extends StatelessWidget {
bool isHidden;
StarRedCustom({this.isHidden});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      child: Visibility(
        visible: isHidden,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/star_red.png"), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
