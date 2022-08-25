import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utlies/app_colors.dart';

enum Packages { Monthly, Yearly, Absolute }

class GooglePaymentScreen extends StatefulWidget {
  static const routeName = "google_payment";

  GooglePaymentScreen({Key key}) : super(key: key);

  @override
  State<GooglePaymentScreen> createState() => _GooglePaymentScreenState();
}

class _GooglePaymentScreenState extends State<GooglePaymentScreen> {
  Packages packagesGroupValue = Packages.Monthly;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "subscription packages".tr(),
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Segoe UI",
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("free period was finish".tr()),
            RadioListTile(
                title: Text("Month"),
                value: Packages.Monthly,
                groupValue: packagesGroupValue,
                onChanged: (value) {
                  packagesGroupValue = value;
                  setState(() {});
                }),
            RadioListTile(
                title: Text("Year"),
                value: Packages.Yearly,
                groupValue: packagesGroupValue,
                onChanged: (value) {
                  packagesGroupValue = value;
                  setState(() {});
                }),
            RadioListTile(
                title: Text("Always"),
                value: Packages.Absolute,
                groupValue: packagesGroupValue,
                onChanged: (value) {
                  packagesGroupValue = value;
                  setState(() {});
                }),
            // GooglePayButton(
            //   width: 200,
            //   height: 50,
            //   paymentConfigurationAsset: "json/google_payment_profile.json",
            //   paymentItems: [
            //     PaymentItem(
            //         amount: "0.0",
            //         label: "label",
            //         type: PaymentItemType.item,
            //         status: PaymentItemStatus.final_price)
            //   ],
            //   style: GooglePayButtonStyle.flat,
            //   type: GooglePayButtonType.pay,
            //   margin: const EdgeInsets.only(top: 15.0),
            //   onPaymentResult: (result) {
            //     print("payment result: $result");
            //   },
            //   loadingIndicator: const Center(
            //     child: CircularProgressIndicator(),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
