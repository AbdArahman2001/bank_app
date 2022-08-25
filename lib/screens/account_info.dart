import '../screens/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../providers/home_provider.dart';
import '../../../screens/custom_screen/single_account_info.dart';
import 'package:provider/provider.dart';

import '../model/app_user.dart';
import '../utlies/app_colors.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key key}) : super(key: key);
  static const routeName = "account_info";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "account_info".tr(),
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Segoe UI",
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<HomeProvider>(builder: (context, provider, x) {
        return loginState.value == LoginState.Test
            ? Center(
                child: Text(
                  "Test Account",
                  style: TextStyle(fontSize: 20),
                ),
              )
            : Container(
                padding: EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SingleAccountInfo(
                        title: "Name".tr(),
                        value: provider.currentUser.name,
                      ),
                      SingleAccountInfo(
                        title: "Email".tr(),
                        value: provider.currentUser.email,
                      ),
                      SingleAccountInfo(
                        title: "account_status".tr(),
                        value:
                            provider.currentUser.isSubscribed?"permanent_subscription".tr():"free_period".tr(),
                      ),
                    ]),
              );
      }),
    );
  }

  String getEndSubscriptionDate( Timestamp registerDate) {
    return DateFormat("DD/MM/YY")
        .format(registerDate.toDate().add(Duration(days: 30)))
        .toString();
  }
}
