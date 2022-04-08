import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'close_button_custom.dart';

class NameExpensesCustom extends StatefulWidget {
  _NameExpensesCustomState createState() => _NameExpensesCustomState();
}

class _NameExpensesCustomState extends State<NameExpensesCustom> {
  TextEditingController controller = new TextEditingController();
  String formattedDate;
  HomeProvider provider;
  String selectedItem = "";
  List arabicExpenses = [
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
    "Other"
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
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Spacer(),
                  CloseButtonCustom(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // DropdownButton(items: arabicExpenses, onChanged: (v){}),
              Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, controller.text);
                    // if(formKey.currentState.validate()){
                    //   Navigator.pop(context, controller.value);
                    // }else{
                    // }
                  },
                  child: Container(
                    height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green,
                        // image: DecorationImage(
                        //   image: AssetImage("assets/images/okk.png"),
                        // ),
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 50,
                      )
                      // Image.asset("assets/images/check (1).png",color: Colors.green,))
                      ),
                ),
              ]),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.pop(context, controller.text);
              //         // if(formKey.currentState.validate()){
              //         //   Navigator.pop(context, controller.value);
              //         // }else{
              //         // }
              //       },
              //       child: Container(
              //         height: 30,
              //         width: 30,
              //         decoration: BoxDecoration(
              //           image: DecorationImage(
              //             image: AssetImage("assets/images/okk.png"),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
