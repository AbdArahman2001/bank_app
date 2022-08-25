import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';
import 'dropdown_custom.dart';

class NameExpensesCustomScreen extends StatefulWidget {
  static final routeName = "NameExpensesCustomScreen";

  _NameExpensesCustomScreenState createState() =>
      _NameExpensesCustomScreenState();
}

class _NameExpensesCustomScreenState extends State<NameExpensesCustomScreen> {
  TextEditingController controller = new TextEditingController();
  String formattedDate;
  HomeProvider provider;
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeProvider>(context);
    controller.text = provider.tresutl;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white.withOpacity(0.3),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  DropDownField(
                      value: selectedItem,
                      controller: controller,
                      itemsVisibleInDropdown: 6,
                      required: false,
                      strict: false,
                      hintText: '"Enter item name"'.tr(),
                      items: arabicExpenses,
                      setter: (dynamic newValue) {
                        selectedItem = newValue;
                      }),
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
                  SizedBox(
                    height: 20,
                  ),
                  // Spacer(),
                  // Form(
                  //   key: formKey,
                  //   child: Center(
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8),
                  //         color: Colors.white,
                  //       ),
                  //       padding: EdgeInsets.only(left: 15, right: 15),
                  //       width: 300,
                  //       height: 430,
                  //       child: Column(
                  //         children: [
                  //           SizedBox(
                  //             height: 5,
                  //           ),
                  //           Row(
                  //             children: [
                  //               Spacer(),
                  //               CloseButtonCustom(),
                  //             ],
                  //           ),
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //           Container(
                  //             padding: EdgeInsets.only(left: 10, right: 10),
                  //             width: MediaQuery.of(context).size.width,
                  //             // height: 48,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10),
                  //               color: Colors.white,
                  //               boxShadow: [
                  //                 BoxShadow(color: AppColors.MAIN_COLOR, spreadRadius: 1),
                  //               ],
                  //             ),
                  //             child: Column(
                  //               children: [
                  //
                  //                 //   TextFormField(
                  //                 //   validator:
                  //                 //     (value){
                  //                 // //  return value.length < 3 ? 'Name must be greater than two characters'.tr() : null;
                  //                 // },
                  //                 //   onFieldSubmitted: (value){
                  //                 //     if(formKey.currentState.validate()){
                  //                 //
                  //                 //     }else{
                  //                 //     }
                  //                 //
                  //                 //   },
                  //                 //   maxLength: 15,
                  //                 //   controller: controller,
                  //                 //   onTap: () {
                  //                 //     // var scrollPosition = _scrollController.position;
                  //                 //     // _scrollController.animateTo(
                  //                 //     //   - scrollPosition.minScrollExtent,
                  //                 //     //   duration: new Duration(milliseconds: 200),
                  //                 //     //   curve: Curves.easeOut,
                  //                 //     // );
                  //                 //   },
                  //                 //   // maxLines: null,
                  //                 //   // initialValue: element.type,
                  //                 //   onChanged: (text) {
                  //                 //     // element
                  //                 //     //     .type = text;
                  //                 //   },
                  //                 //   // focusNode: myFocusNode,
                  //                 //   textAlign: TextAlign.center,
                  //                 //   decoration: InputDecoration(
                  //                 //     counterText: "",
                  //                 //     contentPadding:
                  //                 //     EdgeInsets.zero,
                  //                 //     enabledBorder:
                  //                 //     InputBorder.none,
                  //                 //     hintText: "The expense".tr(),
                  //                 //     hintStyle: TextStyle(color: Colors.redAccent),
                  //                 //     labelStyle: TextStyle(
                  //                 //       fontSize: 13,
                  //                 //       fontWeight: FontWeight.w500,
                  //                 //       fontFamily: 'Tajawal',
                  //                 //       color: AppColors
                  //                 //           .Text_Table_COLOR,
                  //                 //     ),
                  //                 //   ),
                  //                 // )
                  //               ],
                  //             ),
                  //           ),
                  //           Spacer(),
                  //
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ]),
          ),
        ),
      ),
    );
  }
}
