import 'package:bank_app_flutter/model/CardsResponce.dart';
import 'package:flutter/cupertino.dart';

class CardsProvider extends ChangeNotifier {
  CardsProvider() {
    cards = CardsResponce.fromJson({
      "data": [
        {
          "is_new": false,
          "is_visible": false,
          "image": "mada.png",
          "logo" : "madaicon.png",
          "goldId" : "icconsss.png",
          "data": {
            "bank_name": "",
            "card_name": "",
            "limit": 0,
            "type": "",
            "card_number": ""
          }
        },
        {
          "is_new": true,
          "is_visible": false,
          "image": "mada.png",
          "logo" : "madaicon.png",
          "goldId" : "icconsss.png",
          "data": {
            "bank_name": "",
            "card_name": "",
            "limit": 0,
            "type": "",
            "card_number": ""
          }
        },
        {
          "is_new": true,
          "is_visible": false,
          "image": "visa.png",
          "logo" : "logovisa.png",
          "goldId" : "iconswifis.png",
          "data": {
            "bank_name": "",
            "card_name": "",
            "limit": 0,
            "type": "",
            "card_number": ""
          }
        },
        {
          "is_new": true,
          "is_visible": false,
          "image": "master.png",
          "logo" : "master (1).png",
          "goldId" : "iconswifis.png",
          "data": {
            "bank_name": "",
            "card_name": "",
            "limit": 0,
            "type": "",
            "card_number": ""
          }
        }
      ]
    });
  }
  CardsResponce cards;

  var nameBankController = TextEditingController();
  var nameCardController = TextEditingController();
  var limitController = TextEditingController();
  var typeController = TextEditingController();
  var cardNumberController = TextEditingController();


  var nameMadaBankController = TextEditingController();
  var nameMadaCardController = TextEditingController();
  var NoIPANController = TextEditingController();
  var NoAccountController = TextEditingController();
}