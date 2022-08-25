import '../../utlies/app_colors.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hintTextKey;
  Function saveFunction;
  Function menuFunction;
  Function clearFunction;
  Function validateFunction;
  final int nofLines;
  final TextInputType textInputType;
  final FloatingLabelBehavior floatingLabelBehavior;
  final TextEditingController textEditingController;
  final TextInputAction textInputAction;
  bool isHidden;
  final IconButton iconArrow;
      final IconButton iconClear;

  MyTextField({
    this.hintTextKey,
    this.iconArrow,
    this.iconClear,
    this.saveFunction,
    this.menuFunction,
    this.clearFunction,
    this.validateFunction,
    this.nofLines = 1,
    this.textInputType = TextInputType.text,
    this.floatingLabelBehavior,
    this.textEditingController,
    this.textInputAction,
    this.isHidden = false,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}



class _MyTextFieldState extends State<MyTextField> {
  TextEditingController controller = new TextEditingController();
  String selectedItem = "";
  List<String> arabicExpenses = [
    "Clothes",
    "Hair cut salon",
    "Female player",
    "Restaurants",
    "Coffee shop",
    "Sued",
    "Rent",
    "Internet",
    "Electricity",
    "Water",
    "Mobile bill",
    "School expenses",
    "School supplies",
    "Petrol",
    "Oil",
    "Laundry",
    "Spare parts",
    "Maintenance",
    "Irregularities",
    "Club subscription",
    "Entertainment",
    "Taxi",
    "1- A bank card",
    "2- A bank card",
    "3- A bank card",
    "Other",
  ];
  var formKey = GlobalKey<FormState>();
  bool _isToggle1 = true;

  void toggle() {
    setState(() {
      _isToggle1 = !_isToggle1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 2, bottom: 2),
      child: TextFormField(
        obscureText: widget.isHidden,
        cursorColor: AppColors.BG_Table_COLOR,
        textInputAction: widget.textInputAction,
        controller: widget.textEditingController,
        maxLines: widget.nofLines,
        validator: (v) {
          return widget.validateFunction();
        },
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          suffixIcon:
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => widget.clearFunction(),
                icon: Icon(
                  Icons.cancel_outlined,
                ),
              ),
              IconButton(
                icon:
                  _isToggle1 ?  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: Colors.black,
                  ) :  Icon(
              Icons.arrow_drop_up,
              size: 30,
                color: Colors.black,
              ),
                onPressed: () => (){
                  toggle();
                },
              ),

            ],
          ),
          floatingLabelBehavior: widget.floatingLabelBehavior,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), //Change this value to custom as you like
          hintText: widget.hintTextKey,
          isDense: true,
          hintStyle: TextStyle(
            fontSize: 18,
            color: AppColors.MAIN_COLOR,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.BG_Table_COLOR, width: 2.0),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.BG_Table_COLOR, width: 2.0),
          ),
        ),
        onSaved: (newValue) => widget.saveFunction(),
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }
}
