import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'close_button_custom.dart';
import 'dropdown_custom.dart';

class NameExpensesCustom extends StatefulWidget {

  _NameExpensesCustomState createState() => _NameExpensesCustomState();
}

class _NameExpensesCustomState extends State<NameExpensesCustom> {
  TextEditingController controller= new TextEditingController();
  String formattedDate;
  HomeProvider provider;
  String selectedItem = "";
  List<String> arabicExpenses = [
    "Clothes".tr(),
    "Hair cut salon".tr(),
    "Female player".tr(),
    "Restaurants".tr(),
    "Coffee shop".tr(),
    "Sued".tr(),
    "Rent".tr(),
    "Internet".tr(),
    "Electricity".tr(),
    "Water".tr(),
    "Mobile bill".tr(),
    "School expenses".tr(),
    "School supplies".tr(),
    "Petrol".tr(),
    "Oil".tr(),
    "Laundry".tr(),
    "Spare parts".tr(),
    "Maintenance".tr(),
    "Irregularities".tr(),
    "Club subscription".tr(),
    "Entertainment".tr(),
    "Taxi".tr(),
    "1- A bank card".tr(),
    "2- A bank card".tr(),
    "3- A bank card".tr(),
    "Other".tr()
  ];
  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeProvider>(context);
    controller.text = provider.tresutl;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Form(
        key: formKey,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
           padding: EdgeInsets.only(left: 15, right: 15),
          width: 300,
          height: 430,
          child: Column(
            children: [
              SizedBox(height: 5,),
              Row(
                children: [
                  Spacer(),
                  CloseButtonCustom(),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                // height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: AppColors.MAIN_COLOR, spreadRadius: 1),
                  ],
                ),
                child:
                Column(
                  children: [
                    DropDownField(
                    value: selectedItem,
                        controller: controller,
                        itemsVisibleInDropdown: 6,
                    required: false,
                    strict: false,
                    hintText: 'اختر اسم المصروف',
                    items: arabicExpenses,
                    setter: (dynamic newValue) {
                      selectedItem = newValue;

                    }
                ),
                  //   TextFormField(
                  //   validator:
                  //     (value){
                  // //  return value.length < 3 ? 'Name must be greater than two characters'.tr() : null;
                  // },
                  //   onFieldSubmitted: (value){
                  //     if(formKey.currentState.validate()){
                  //
                  //     }else{
                  //     }
                  //
                  //   },
                  //   maxLength: 15,
                  //   controller: controller,
                  //   onTap: () {
                  //     // var scrollPosition = _scrollController.position;
                  //     // _scrollController.animateTo(
                  //     //   - scrollPosition.minScrollExtent,
                  //     //   duration: new Duration(milliseconds: 200),
                  //     //   curve: Curves.easeOut,
                  //     // );
                  //   },
                  //   // maxLines: null,
                  //   // initialValue: element.type,
                  //   onChanged: (text) {
                  //     // element
                  //     //     .type = text;
                  //   },
                  //   // focusNode: myFocusNode,
                  //   textAlign: TextAlign.center,
                  //   decoration: InputDecoration(
                  //     counterText: "",
                  //     contentPadding:
                  //     EdgeInsets.zero,
                  //     enabledBorder:
                  //     InputBorder.none,
                  //     hintText: "The expense".tr(),
                  //     hintStyle: TextStyle(color: Colors.redAccent),
                  //     labelStyle: TextStyle(
                  //       fontSize: 13,
                  //       fontWeight: FontWeight.w500,
                  //       fontFamily: 'Tajawal',
                  //       color: AppColors
                  //           .Text_Table_COLOR,
                  //     ),
                  //   ),
                  // )
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, controller.text);
                      // if(formKey.currentState.validate()){
                      //   Navigator.pop(context, controller.value);
                      // }else{
                      // }

                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/okk.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
