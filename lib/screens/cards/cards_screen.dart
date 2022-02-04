import 'package:bank_app_flutter/providers/cards_provider.dart';
import 'package:bank_app_flutter/screens/cards/custom/add_card_information_custom.dart';
import 'package:bank_app_flutter/screens/cards/custom/edit_card_information_custom.dart';
import 'package:bank_app_flutter/screens/cards/monthly_income_screen.dart';
import 'package:bank_app_flutter/screens/custom_screen/star_red_custom.dart';
import 'package:bank_app_flutter/screens/salary/table_of_salary.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

import 'custom/text_form_feild_custom.dart';

class CardsScreen extends StatefulWidget {
  static final routeName = "CardsScreen";

  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  bool _isVisible = false;
  bool _add_isVisible = false;
  bool _edit_isVisible = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Back_Ground_COLOR,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Consumer<CardsProvider>(builder: (context, provider, x) {
        return SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  // SizedBox(
                  //   height: 60,
                  // ),
                  Icon(
                    Icons.error_outline,
                    color: AppColors.Next_Back_COLOR,
                    size: 36.0,
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    height: 55,
                    child: Text(
                      "هذه العملية لا تحتاج إلى إدخال البيانات السرية \n للبطاقة فقط تحتاج لمعلومات عامة للعمليات التنظيمية",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color:
                                    AppColors.Divider_COLOR.withOpacity(0.18),
                                width: 1.0))),
                  ),
                  Expanded(
                    // height: MediaQuery.of(context).size.height * 0.380,

                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Directionality(
                              textDirection: ui.TextDirection.rtl,
                              child: Visibility(
                                visible: _isVisible,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 50, right: 50, top: 15),
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                    right: 30,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                        children: provider
                                                .cards.data[selectedIndex].isNew
                                            ? [
                                                Image(
                                                  image: AssetImage(
                                                      "assets/images/" +
                                                          provider
                                                              .cards
                                                              .data[
                                                                  selectedIndex]
                                                              .logo),
                                                  width: provider
                                                              .cards
                                                              .data[
                                                                  selectedIndex]
                                                              .logo ==
                                                          "master (1).png"
                                                      ? 90
                                                      : provider
                                                                  .cards
                                                                  .data[
                                                                      selectedIndex]
                                                                  .logo ==
                                                              "madaicon.png"
                                                          ? 130
                                                          : 120,
                                                ),
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Text(
                                                    "اختياري",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Segoe UI",
                                                      color: AppColors
                                                          .Text_Card_COLOR,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                GestureDetector(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/add_card.png'),
                                                          colorFilter:
                                                              ColorFilter.mode(
                                                                  Colors
                                                                      .transparent,
                                                                  BlendMode
                                                                      .color),
                                                          fit: BoxFit.none),
                                                    ),
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                  onTap: () {
                                                    selectedIndex == 0 ||
                                                            selectedIndex == 1
                                                        ? _edit_isVisible = true
                                                        : _add_isVisible = true;
                                                    _isVisible = !_isVisible;
                                                    provider.notifyListeners();
                                                    // EditCardInformationCustom();
                                                  },
                                                ),
                                              ]
                                            : [
                                                Image(
                                                  image: AssetImage(
                                                      "assets/images/" +
                                                          provider
                                                              .cards
                                                              .data[
                                                                  selectedIndex]
                                                              .logo),
                                                  width: provider
                                                              .cards
                                                              .data[
                                                                  selectedIndex]
                                                              .logo ==
                                                          "master (1).png"
                                                      ? 90
                                                      : provider
                                                                  .cards
                                                                  .data[
                                                                      selectedIndex]
                                                                  .logo ==
                                                              "madaicon.png"
                                                          ? 130
                                                          : 120,
                                                ),
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    provider
                                                        .cards
                                                        .data[selectedIndex]
                                                        .isNew = true;
                                                    _isVisible = !_isVisible;

                                                    provider
                                                        .cards
                                                        .data[selectedIndex]
                                                        .isVisible = false;
                                                    provider.notifyListeners();
                                                  },
                                                  child: Visibility(
                                                    visible: selectedIndex != 0,
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                          Icons.delete,
                                                          color: AppColors
                                                              .Text_Card_COLOR,
                                                          size: 20.0,
                                                        ),
                                                        Text(
                                                          "حذف",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily:
                                                                "Segoe UI",
                                                            color: AppColors
                                                                .Text_Card_COLOR,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                GestureDetector(
                                                  child: Column(children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/edit_card.png'),
                                                            colorFilter:
                                                                ColorFilter.mode(
                                                                    Colors
                                                                        .transparent,
                                                                    BlendMode
                                                                        .color),
                                                            fit: BoxFit.none),
                                                      ),
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      "تعديل",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: "Segoe UI",
                                                        color: AppColors
                                                            .Text_Card_COLOR,
                                                      ),
                                                    ),
                                                  ]),
                                                  onTap: () {
                                                    selectedIndex == 0 ||
                                                            selectedIndex == 1
                                                        ? _edit_isVisible = true
                                                        : _add_isVisible = true;
                                                    _isVisible = !_isVisible;
                                                    provider.notifyListeners();
                                                    // EditCardInformationCustom();
                                                  },
                                                ),
                                              ],
                                      ),
                                      Column(children: [
                                        // Row(
                                        //   children: [
                                        //     Image(
                                        //       image: AssetImage("assets/images/" +
                                        //           provider.cards
                                        //               .data[selectedIndex].logo),
                                        //       width: provider
                                        //           .cards
                                        //           .data[selectedIndex]
                                        //           .logo ==
                                        //           "master (1).png"
                                        //           ? 90
                                        //           : provider
                                        //           .cards
                                        //           .data[selectedIndex]
                                        //           .logo ==
                                        //           "madaicon.png"
                                        //           ? 130
                                        //           : 120,
                                        //     ),
                                        //   ],
                                        // ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: provider
                                                          .cards
                                                          .data[selectedIndex]
                                                          .goldId ==
                                                      "icconsss.png"
                                                  ? 0
                                                  : 30),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    "assets/images/" +
                                                        provider
                                                            .cards
                                                            .data[
                                                                selectedIndex]
                                                            .goldId),
                                                width: provider
                                                            .cards
                                                            .data[
                                                                selectedIndex]
                                                            .goldId ==
                                                        "iconswifis.png"
                                                    ? 100
                                                    : provider
                                                                .cards
                                                                .data[
                                                                    selectedIndex]
                                                                .goldId ==
                                                            "icconsss.png"
                                                        ? 140
                                                        : 120,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 30),
                                          child: Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "****   ****   ****   ****",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily:
                                                            "Segoe UI",
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Card Number",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily:
                                                            "Segoe UI",
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "00/00",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily:
                                                            "Segoe UI",
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Available Credit Limit",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily:
                                                            "Segoe UI",
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Bank name",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: "Segoe UI",
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Card  Name",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: "Segoe UI",
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    // color: Colors.transparent,
                                    border: Border.all(
                                        color: AppColors.App_Bar_COLOR),
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xFF5F88A0),
                                        const Color(0xFF024268),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      // stops: [0.0, 1.0],
                                      // tileMode: TileMode.clamp
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  height: 250,
                                ),
                              ),
                            ),
                            // EditCardInformationCustom(),
                            Visibility(
                              visible: _add_isVisible,
                              child: Container(
                                padding: EdgeInsets.only(left: 32, right: 32),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 35,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 5),
                                      height: 460,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(25),
                                        color:
                                            AppColors.Border_COLOR.withOpacity(
                                                0.29),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Spacer(),
                                              GestureDetector(
                                                  onTap: () {
                                                    _add_isVisible =
                                                        !_add_isVisible;
                                                    provider
                                                        .cards
                                                        .data[selectedIndex]
                                                        .isNew = false;
                                                    provider
                                                        .cards
                                                        .data[selectedIndex]
                                                        .isVisible = false;
                                                    provider.notifyListeners();
                                                  },
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
                                                onTap: () {
                                                  _add_isVisible =
                                                      !_add_isVisible;

                                                  provider
                                                      .cards
                                                      .data[selectedIndex]
                                                      .isVisible = false;
                                                  provider.notifyListeners();
                                                },
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
                                            controller:
                                                provider.nameBankController,
                                            texthint: "اكتب هنا",
                                            textInputAction:
                                                TextInputAction.next,
                                            textInputType: TextInputType.name,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),

                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                            controller:
                                                provider.nameCardController,
                                            texthint: "اكتب هنا",
                                            textInputAction:
                                                TextInputAction.next,
                                            textInputType: TextInputType.name,
                                          ),

                                          SizedBox(
                                            height: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                            controller:
                                                provider.limitController,
                                            texthint: "850000",
                                            textInputAction:
                                                TextInputAction.next,
                                            textInputType: TextInputType.number,
                                          ),

                                          SizedBox(
                                            height: 3,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                            controller: provider.typeController,
                                            texthint: "2840473532",
                                            textInputAction:
                                                TextInputAction.next,
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
                                            controller:
                                                provider.cardNumberController,
                                            texthint: "اكتب هنا",
                                            textInputAction:
                                                TextInputAction.done,
                                            textInputType: TextInputType.name,
                                            icon: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 8, left: 8),
                                              child: Wrap(children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    provider
                                                        .cardNumberController
                                                        .clear();
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
                                                        ClipboardData(
                                                            text: provider
                                                                .cardNumberController
                                                                .text));
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
                              ),
                            ),
                            Visibility(
                              visible: _edit_isVisible,
                              child: Container(
                                padding: EdgeInsets.only(left: 32, right: 32),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 35,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 5),
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      height: 280,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(25),
                                        color:
                                            AppColors.Border_COLOR.withOpacity(
                                                0.29),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Spacer(),
                                              GestureDetector(
                                                  onTap: () {
                                                    _edit_isVisible =
                                                        !_edit_isVisible;
                                                    provider
                                                        .cards
                                                        .data[selectedIndex]
                                                        .isNew = false;
                                                    provider
                                                        .cards
                                                        .data[selectedIndex]
                                                        .isVisible = false;
                                                    provider.notifyListeners();
                                                  },
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
                                                onTap: () {
                                                  _edit_isVisible =
                                                      !_edit_isVisible;

                                                  provider
                                                      .cards
                                                      .data[selectedIndex]
                                                      .isVisible = false;
                                                  provider.notifyListeners();
                                                },
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
                                            // SizedBox(
                                            //   width: 5,
                                            // ),
                                            Container(
                                              width: 80,
                                              child: Text(
                                                "اسم البنك",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: "Segoe UI",
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: TextFormFeildCustom(
                                                controller: provider
                                                    .nameMadaBankController,
                                                texthint: "اكتب هنا",
                                                textInputAction:
                                                    TextInputAction.next,
                                                textInputType:
                                                    TextInputType.name,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              StarRedCustom(
                                                isHidden: true,
                                              ),
                                              Row(children: [
                                                Container(
                                                  width: 80,
                                                  child: Text(
                                                    "اسم البطاقة",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible(
                                                  child: TextFormFeildCustom(
                                                    controller: provider
                                                        .nameMadaCardController,
                                                    texthint: "اكتب هنا",
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    textInputType:
                                                        TextInputType.name,
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
                                            Container(
                                              width: 80,
                                              child: Text(
                                                "رقم الإيبان",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: TextFormFeildCustom(
                                                controller:
                                                    provider.NoIPANController,
                                                texthint: "1234535657",
                                                textInputAction:
                                                    TextInputAction.next,
                                                textInputType:
                                                    TextInputType.number,
                                                icon: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 8, left: 8),
                                                  child: Wrap(children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        provider.NoIPANController
                                                            .clear();
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
                                                            ClipboardData(
                                                                text: provider
                                                                    .NoIPANController
                                                                    .text));
                                                      },
                                                      child: Icon(
                                                        Icons.copy,
                                                        color: AppColors
                                                            .MAIN_COLOR,
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
                                            Container(
                                              width: 80,
                                              child: Text(
                                                "رقم الحساب",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: TextFormFeildCustom(
                                                controller: provider
                                                    .NoAccountController,
                                                texthint: "2840473532",
                                                textInputAction:
                                                    TextInputAction.done,
                                                textInputType:
                                                    TextInputType.number,
                                                icon: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 8, left: 8),
                                                  child: Wrap(children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        provider.NoAccountController
                                                            .clear();
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
                                                            ClipboardData(
                                                                text: provider
                                                                    .NoAccountController
                                                                    .text));
                                                      },
                                                      child: Icon(
                                                        Icons.copy,
                                                        color: AppColors
                                                            .MAIN_COLOR,
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
                              ),
                            ),
                            Directionality(
                              textDirection: ui.TextDirection.ltr,
                              child: Container(
                                width: 225,
                                height: 370,
                                child: Stack(
                                  children: provider.cards.data
                                      .where((i) => !i.isVisible)
                                      .toList()
                                      .asMap()
                                      .map((i, e) {
                                        double top_spacer = 35.0 + (60 * i);
                                        return MapEntry(
                                            i,
                                            GestureDetector(
                                              onTap: () {
                                                if (!_isVisible &&
                                                    !_add_isVisible &&
                                                    !_edit_isVisible) {
                                                  selectedIndex = i;
                                                  _isVisible = !_isVisible;
                                                  e.isVisible = true;
                                                } else if (!_add_isVisible &&
                                                    !_edit_isVisible) {
                                                  provider
                                                      .cards
                                                      .data[selectedIndex]
                                                      .isVisible = false;

                                                  _isVisible = !_isVisible;
                                                }
                                                provider.notifyListeners();
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: top_spacer),
                                                child: Stack(children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(top: 5),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: AppColors
                                                                .App_Bar_COLOR),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/' +
                                                                  e.image),
                                                          fit: BoxFit.none,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      height: 136,
                                                      width: 225,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 12, left: 12),
                                                    child: Row(
                                                      children: e.isNew
                                                          ? [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  //color: Colors.transparent,
                                                                  image:
                                                                      DecorationImage(
                                                                    image: AssetImage(
                                                                        'assets/images/add_card.png'),
                                                                    colorFilter: ColorFilter.mode(
                                                                        Colors
                                                                            .transparent,
                                                                        BlendMode
                                                                            .color),
                                                                    // fit: BoxFit.none,
                                                                  ),
                                                                ),
                                                                height: 16,
                                                                width: 16,
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                "اختياري",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontFamily:
                                                                      "Segoe UI",
                                                                  color: AppColors
                                                                      .Text_Card_COLOR,
                                                                ),
                                                              ),
                                                            ]
                                                          : [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/edit_card.png'),
                                                                      colorFilter: ColorFilter.mode(
                                                                          Colors
                                                                              .transparent,
                                                                          BlendMode
                                                                              .color),
                                                                      fit: BoxFit
                                                                          .none),
                                                                ),
                                                                height: 15,
                                                                width: 15,
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Visibility(
                                                                visible: i != 0,
                                                                child: Text(
                                                                  "حذف",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontFamily:
                                                                        "Segoe UI",
                                                                    color: AppColors
                                                                        .Text_Card_COLOR,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                    ),
                                                  ),
                                                ]),
                                              ),
                                            ));
                                      })
                                      .values
                                      .toList(),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),

                  /////////////////////////////////
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                width: 29,
                                height: 43,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.MAIN_COLOR,
                                  size: 30.0,
                                ),
                              ),
                              // SizedBox(height: 5,),
                              Text(
                                "السابق",
                                style: TextStyle(
                                    color: AppColors.MAIN_COLOR,
                                    fontSize: 13,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TableOfSaralyScreen()),
                            );
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.MAIN_COLOR,
                                  size: 30.0,
                                ),
                                width: 29,
                                height: 43,
                              ),
                              Text(
                                "التالي",
                                style: TextStyle(
                                    color: AppColors.MAIN_COLOR,
                                    fontSize: 13,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
