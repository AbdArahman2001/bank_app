import 'package:bank_app_flutter/screens/cards/custom/text_form_feild_custom.dart';
import 'package:bank_app_flutter/screens/custom_screen/star_red_custom.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditCardInformationCustom extends StatefulWidget {
  @override
  _EditCardInformationCustomState createState() =>
      _EditCardInformationCustomState();
}

class _EditCardInformationCustomState extends State<EditCardInformationCustom> {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var nameBankController = TextEditingController();
    var nameCardController = TextEditingController();
    var NoIPANController = TextEditingController();
    var NoAccountController = TextEditingController();

    return Visibility(
      visible: _isVisible,
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
           margin: EdgeInsets.only(left: 10,right: 10),
            height: 280,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
              color: AppColors.Border_COLOR.withOpacity(0.29),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/save.png',
                              ),
                              fit: BoxFit.none,
                            ),
                            //  shape: BoxShape.circle,
                          ),
                        )),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: showToast,
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 25.0,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Row(children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "اسم البنك",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 290,
                    child: TextFormFeildCustom(
                      controller: nameBankController,
                      texthint: "اكتب هنا",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                ]),
                SizedBox(
                  height: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StarRedCustom(
                      isHidden: true,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "اسم البطاقة",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 290,
                        child: TextFormFeildCustom(
                          controller: nameCardController,
                          texthint: "اكتب هنا",
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                    ]),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "رقم الإيبان",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 290,
                    child: TextFormFeildCustom(
                      controller: NoIPANController,
                      texthint: "1234535657",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                      icon: Padding(
                        padding: EdgeInsets.only(top: 8, left: 8),
                        child: Wrap(children: [
                          GestureDetector(
                            onTap: () {
                              NoIPANController.clear();
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 25.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await Clipboard.setData(
                                  ClipboardData(text: NoIPANController.text));
                            },
                            child: Icon(
                              Icons.copy,
                              color: AppColors.MAIN_COLOR,
                              size: 25.0,
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                ]),
                SizedBox(
                  height: 12,
                ),
                Row(children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "رقم الحساب",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 290,
                    child: TextFormFeildCustom(
                      controller: NoAccountController,
                      texthint: "2840473532",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.number,
                      icon: Padding(
                        padding: EdgeInsets.only(top: 8, left: 8),
                        child: Wrap(children: [
                          GestureDetector(
                            onTap: () {
                              NoAccountController.clear();
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 25.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await Clipboard.setData(ClipboardData(
                                  text: NoAccountController.text));
                            },
                            child: Icon(
                              Icons.copy,
                              color: AppColors.MAIN_COLOR,
                              size: 25.0,
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ]),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
