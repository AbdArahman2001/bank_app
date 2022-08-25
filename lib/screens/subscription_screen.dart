import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../providers/home_provider.dart';
import '../../../screens/subscription_success.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import '../model/app_user.dart';
import '../utlies/app_colors.dart';



class SubscriptionScreen extends StatefulWidget {
  static const routeName = "subscription_screen";

  SubscriptionScreen({Key key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  SubscriptionPackage packagesGroupValue = SubscriptionPackage.Month;

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
            Text(
              // TODO change it
              //"hello",
            "free period was finish".tr(),
            // Provider.of<HomeProvider>(context).currentUser.subscriptionDate == null? "free period was finish".tr():"subscription expired".tr(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "Segoe UI",
                fontWeight: FontWeight.bold,
              ),
            ),
            RadioListTile(
              title: Text(
                "month_subscription".tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w600,
                ),
              ),
              value: SubscriptionPackage.Month,
              groupValue: packagesGroupValue,
              onChanged: choosePackage,
            ),
            RadioListTile(
              title: Text(
                "year_subscription".tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w600,
                ),
              ),
              value: SubscriptionPackage.Year,
              groupValue: packagesGroupValue,
              onChanged: choosePackage,
            ),
            RadioListTile(
              title: Text("forever_subscription".tr(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Segoe UI",
                    fontWeight: FontWeight.w600,
                  )),
              value: SubscriptionPackage.Forever,
              groupValue: packagesGroupValue,
              onChanged: choosePackage,
            ),
            Platform.isAndroid
                ? GooglePayButton(
                    width: 200,
                    height: 50,
                    paymentConfigurationAsset:
                        "json/google_payment_profile.json",
                    paymentItems: [
                      PaymentItem(
                          amount: packagesGroupValue.getAmount().toString(),
                          label: packagesGroupValue.getLabel(),
                          type: PaymentItemType.item,
                          status: PaymentItemStatus.final_price)
                    ],
                    style: GooglePayButtonStyle.white,
                    type: GooglePayButtonType.pay,
                    margin: const EdgeInsets.only(top: 15.0),
                    onPaymentResult: (result) {
                      print("payment result: $result");
                      Navigator.of(context).pushReplacementNamed(SubscriptionSuccess.routeName);
                    },
                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : ApplePayButton(
                    width: 200,
                    height: 50,
                    paymentConfigurationAsset:
                        "json/apple_payment_profile.json",
                    paymentItems: [
                      PaymentItem(
                          amount: packagesGroupValue.getAmount().toString(),
                          label: packagesGroupValue.getLabel(),
                          type: PaymentItemType.item,
                          status: PaymentItemStatus.final_price)
                    ],
                    style: ApplePayButtonStyle.black,
                    type: ApplePayButtonType.buy,
                    margin: const EdgeInsets.only(top: 15.0),
                    onPaymentResult: (result) {
                      print("payment result: $result");
                    },
                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  choosePackage(SubscriptionPackage package) {
    packagesGroupValue = package;
    setState(() {});
  }
  void test(){

  }
}



