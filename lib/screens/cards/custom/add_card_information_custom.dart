
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../screens/cards/custom/text_form_feild_custom.dart';

import '../../../utlies/app_colors.dart';
import '../../custom_screen/star_red_custom.dart';


class AddCardInformationCustom extends StatefulWidget {
  @override
  State<AddCardInformationCustom> createState() =>
      _AddCardInformationCustomState();
}

class _AddCardInformationCustomState extends State<AddCardInformationCustom> {
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
    var limitController = TextEditingController();
    var typeController = TextEditingController();
    var cardNumberController = TextEditingController();

    return Visibility(
      visible: _isVisible,
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
            height: 460,
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
                // SizedBox(height: 3,),
                Row(children: [
                  SizedBox(
                    width: 13,
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
                ]),
                SizedBox(
                  height: 5,
                ),
                TextFormFeildCustom(
                  controller: nameBankController,
                  texthint: "اكتب هنا",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                ),
                SizedBox(
                  height: 5,
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
                    ]),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormFeildCustom(
                  controller: nameCardController,
                  texthint: "اكتب هنا",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                ),

                SizedBox(
                  height: 5,
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
                        "الحد الإئتماني المتاح",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ],
                ),

                SizedBox(
                  height: 5,
                ),
                TextFormFeildCustom(
                  controller: limitController,
                  texthint: "850000",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                ),

                SizedBox(
                  height: 3,
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
                        "نوع البطاقة الإتمانية",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ],
                ),

                SizedBox(
                  height: 5,
                ),
                TextFormFeildCustom(
                  controller: typeController,
                  texthint: "2840473532",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                ),

                SizedBox(
                  height: 5,
                ),
                Row(children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "رقم البطاقة الإتمانية",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 5,
                ),
                TextFormFeildCustom(
                  controller: cardNumberController,
                  texthint: "اكتب هنا",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.name,
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8, left: 8),
                    child: Wrap(children: [
                      GestureDetector(
                        onTap: () {
                          cardNumberController.clear();
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
                              ClipboardData(text: cardNumberController.text));
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
