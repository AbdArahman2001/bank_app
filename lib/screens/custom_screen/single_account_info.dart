import 'package:flutter/material.dart';
import '../../../utlies/app_colors.dart';
class SingleAccountInfo extends StatelessWidget {
  const SingleAccountInfo({Key key, this.title, this.value}) : super(key: key);
final String title;
final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Text(title ,textAlign: TextAlign.start,style: TextStyle(
      color: Colors.black,
        fontSize: 16,
        fontFamily: "Segoe UI",
        fontWeight: FontWeight.w500,
      ),),
          ),
          SizedBox(width: 10,),
          Flexible(
            flex: 4,
            child: Text(value,textAlign: TextAlign.start, style: TextStyle(
              color: AppColors.MAIN_COLOR,
              fontSize: 16,
              fontFamily: "Segoe UI",
              fontWeight: FontWeight.w600,
            ),),
          ),
        ],
      ),
    );
  }
}
