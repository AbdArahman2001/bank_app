import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';
import 'package:in_app_purchase/in_app_purchase.dart';


class ProviderModel with ChangeNotifier {
  InAppPurchase _iap = InAppPurchase.instance;
  bool available = true;
  StreamSubscription subscription;
  final String myProductID = 'test_2_product';

  bool _isPurchased = false;
  bool get isPurchased => _isPurchased;
  set isPurchased(bool value) {
    _isPurchased = value;
    notifyListeners();
  }




  List _purchases = [];
  List get purchases => _purchases;
  set purchases(List value) {
    _purchases = value;
    notifyListeners();
  }


  List _products = [];
  List get products => _products;
  set products(List value) {
    _products = value;
    notifyListeners();
  }



  void initialize() async {
    available = await _iap.isAvailable();
    if (available) {
      await _getProducts();
     await _getPastPurchases();
      verifyPurchase();
      subscription = _iap.purchaseStream.listen((data) {
        purchases.addAll(data);
        verifyPurchase();
      });
    }
  }


  void verifyPurchase() {
    PurchaseDetails purchase = hasPurchased(myProductID);

    if (purchase != null && purchase.status == PurchaseStatus.purchased) {

      if (purchase.pendingCompletePurchase) {
        _iap.completePurchase(purchase);

        if (purchase != null && purchase.status == PurchaseStatus.purchased) {
          isPurchased = true;
        }
      }

    }
  }


  PurchaseDetails hasPurchased(String productID) {
    return purchases
        .firstWhereOrNull((purchase) => purchase.productID == productID);
  }



  Future<void> _getProducts() async {
    print("getting products...");
    Set<String> ids = Set.from([myProductID]);
    ProductDetailsResponse response = await _iap.queryProductDetails(ids);
    print("response:\nlength: ${response.productDetails.length}\nnot found ids: ${response.notFoundIDs}");
    products = response.productDetails;
  }


  Future<void> _getPastPurchases() async {
     await _iap.restorePurchases();
     List<PurchaseDetails> response =await _iap.purchaseStream.first;
    for (PurchaseDetails purchase in  response) {
      if (Platform.isIOS) {
        _iap.completePurchase(purchase);
      }
    } purchases = response;

  }



}