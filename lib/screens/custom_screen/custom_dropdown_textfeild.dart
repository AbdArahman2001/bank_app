import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/screens/custom_screen/close_button_custom.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropdownTextfeildScreen extends StatefulWidget {
  @override
  State<CustomDropdownTextfeildScreen> createState() =>
      _CustomDropdownTextfeildScreenState();
}

class _CustomDropdownTextfeildScreenState
    extends State<CustomDropdownTextfeildScreen> {
  final _formKey = GlobalKey<FormState>();


  TextEditingController controller = new TextEditingController();

  FocusNode focusNode = FocusNode();

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

  bool _isToggle1 = true;
  bool isText = true;
  bool isClear = false;
  bool isUpArrow = true;

  void toggle() {
    setState(() {
      _isToggle1 = !_isToggle1;
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);

    provider = Provider.of<HomeProvider>(context);
    controller.text = provider.tresutl;
    controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));

    return Form(
      key: _formKey,
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            height: isText ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height/3.5,
            // width: 400,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.Border_COLOR),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: AppColors.bg_COLOR,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    CloseButtonCustom(),
                  ],
                ),
                Container(
                  // height: 40,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 2, bottom: 2),
                  child: TextFormField(
                    focusNode: focusNode,
                    onTap: (){
                      controller.text.length == 0 ? false : true;
                    },
                    validator: (value){
                       // controller.text.length == 0 || controller.text.length > 3  ? false : true;
                       return  controller.text.length  > 17 ? 'Name must be less than 15 characters'.tr() : null;
                    },
                    maxLength: 15,
                    onChanged: (v){
                      // controller.text.length == 0 ? false : true;

                    },

                    // validator: (value) {
                    //   value == null || value.isEmpty ?
                    //      isClear = false : isClear= true;
                    // },

                    // obscureText: widget.isHidden,
                    cursorColor: AppColors.BG_Table_COLOR,
                    textInputAction: TextInputAction.done,
                    controller: controller,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      counterText: '',
                      suffixIcon: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                           // visible:  controller.text.length == 0 ? false : true,
                            child: IconButton(
                              onPressed: () {
                                controller.clear();
                              },
                              icon: Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                _isToggle1 ? isText = false: isText = true;
                                setState(() {
                                  toggle();
                                });

                              },
                              icon: _isToggle1 ? Icon(
                                Icons.arrow_drop_down,
                                size: 30,
                                color: Colors.black,
                              )
                                :  Icon(
                                Icons.arrow_drop_up,
                                size: 30,
                                color: Colors.black,
                              ),

                              ),
                        ],
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      hintText: "Enter item name".tr(),
                      isDense: true,
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: AppColors.MAIN_COLOR,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.BG_Table_COLOR, width: 2.0),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.BG_Table_COLOR, width: 2.0),
                      ),
                    ),
                    onSaved: (newValue) => () {},
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                Visibility(
                  visible: isText,
                  child: Expanded(
                    child: Container(
                      // height: MediaQuery.of(context).size.height/3.2,
                      child: ListView.builder(

                        itemBuilder: (BuildContext, index) {
                          return GestureDetector(
                            onTap: (){
                              controller.text = arabicExpenses[index].tr();
                              controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
                            },
                            child: Card(
                              child: ListTile(
                                leading:  Text(
                                  "${index+1} -",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                title: Text(
                                  arabicExpenses[index].tr(),
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: arabicExpenses.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,

                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // padding: EdgeInsets.only(left: 16, right: 16),
                  height: 60,
                  // color: Colors.red,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                            // color: Colors.red,
                            ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {

                            if(_formKey.currentState.validate()){
                              Navigator.pop(context, controller.text);
                            }else{
                            }


                          },
                          child: Center(
                            child: Container(
                                height: 50,
                                width: 50,
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
                                  size: 30,
                                )
                                // Image.asset("assets/images/check (1).png",color: Colors.green,))
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            // color: Colors.black
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
