import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/screens/custom_screen/numbers_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllNumbersCustom extends StatelessWidget {
  HomeProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeProvider>(context);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Numbers_Custom("1", () => provider.setNumber("1")),
              Numbers_Custom("2", () => provider.setNumber("2")),
              Numbers_Custom("3", () => provider.setNumber("3")),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Numbers_Custom("4", () => provider.setNumber("4")),
              Numbers_Custom("5", () => provider.setNumber("5")),
              Numbers_Custom("6", () => provider.setNumber("6")),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Numbers_Custom("7", () => provider.setNumber("7")),
              Numbers_Custom("8", () => provider.setNumber("8")),
              Numbers_Custom("9", () => provider.setNumber("9")),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Numbers_Custom("C", () => provider.clearNumber()),
              Numbers_Custom("0", () => provider.setNumber("0")),
              Numbers_Custom(".", () => provider.setNumber(".")),
            ],
          ),
        ],
      ),
    );
  }
}
