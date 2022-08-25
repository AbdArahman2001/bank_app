import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bank/providers/home_provider.dart';
import 'package:bank/screens/home_screen.dart';
import 'package:bank/screens/launch_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_platform_interface/in_app_purchase_platform_interface.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:provider/provider.dart';

import '../controllers/consumable_store.dart';

const bool _kAutoConsume = true;

const String _kConsumableId = 'consumable';
// const String monthSubscription = 'bank_5_product';
// const String sixMonthSubscription = 'bank_10_product';
// const String yearSubscription = 'bank_20_product';
// const String testProduct = 'test_2_product';
// const String test_3_product = 'test_3_product';
// const String test_4_product = 'test_4_product';

const String appSubscription = "app_subscription";


const List<String> _kProductIds = <String>[
appSubscription
];

class PurchaseScreen extends StatefulWidget {
  static final String routeName = "/purchaseScreen";

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>> _subscription;
  List<String> _notFoundIds = <String>[];
  List<ProductDetails> _products = <ProductDetails>[];
  List<PurchaseDetails> _purchases = <PurchaseDetails>[];
  List<String> _consumables = <String>[];
  bool _isAvailable = true;
  bool _purchasePending = false;
  bool _loading = true;
  String _queryProductError;

  @override
  void initState() {
    print("starting purchase screen");
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
      print("onDone Subscription");
    }, onError: (Object error) {
      print("error initialization in app purchase");
    });
    initStoreInfo();
    super.initState();
  }

  Future<void> initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      setState(() {
        _isAvailable = isAvailable;
        _products = <ProductDetails>[];
        _purchases = <PurchaseDetails>[];
        _notFoundIds = <String>[];
        _consumables = <String>[];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    final ProductDetailsResponse productDetailResponse =
        await _inAppPurchase.queryProductDetails(_kProductIds.toSet());
    if (productDetailResponse.error != null) {
      setState(() {
        _queryProductError = productDetailResponse.error.message;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = <PurchaseDetails>[];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _consumables = <String>[];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      setState(() {
        _queryProductError = null;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = <PurchaseDetails>[];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _consumables = <String>[];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    final List<String> consumables = await ConsumableStore.load();
    setState(() {
      _isAvailable = isAvailable;
      _products = productDetailResponse.productDetails;
      _notFoundIds = productDetailResponse.notFoundIDs;
      _consumables = consumables;
      _purchasePending = false;
      _loading = false;
    });
  }

  @override
  void dispose() {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> stack = <Widget>[];
    if (_queryProductError == null) {
      stack.add(
        ListView(
          children: <Widget>[
            //_buildConnectionCheckTile(),
            _buildProductList(),
            // _buildConsumableBox(),
            //_buildRestoreButton(),
          ],
        ),
      );
    } else {
      stack.add(Center(
        child: Text(_queryProductError),
      ));
    }
    if (_purchasePending) {
      stack.add(
        Stack(
          children: const <Widget>[
            Opacity(
              opacity: 0.3,
              child: ModalBarrier(dismissible: false, color: Colors.grey),
            ),
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      );
    }

    return  Scaffold(
        appBar: AppBar(
          title: Text('subscription_screen'.tr()),
        ),
        body: Stack(
          children: stack,
        ),
    );
  }

  Card _buildConnectionCheckTile() {
    if (_loading) {
      return Card(child: ListTile(title: Text('trying_connect'.tr())));
    }
    final Widget storeHeader = ListTile(
      leading: Icon(_isAvailable ? Icons.check : Icons.block,
          color: _isAvailable ? Colors.green : ThemeData.light().errorColor),
      title: Text(
          _isAvailable ? "available_store".tr() : "not_available_store".tr()),
    );
    final List<Widget> children = <Widget>[storeHeader];

    if (!_isAvailable) {
      children.addAll(<Widget>[
        const Divider(),
        ListTile(
          title: Text('Not connected',
              style: TextStyle(color: ThemeData.light().errorColor)),
          subtitle: Text("unable_connect_payment_process".tr()),
        ),
      ]);
    }
    return Card(child: Column(children: children));
  }

  Card _buildProductList() {
    if (_loading) {
      return Card(
          child: ListTile(
              leading: CircularProgressIndicator(),
              title: Text('loading'.tr())));
    }
    if (!_isAvailable) {
      return const Card();
    }
    ListTile productHeader = ListTile(title: Text("subscription expired".tr()));
    final List<ListTile> productList = <ListTile>[];
    if (_notFoundIds.isNotEmpty) {
      productList.add(ListTile(
          title: Text('[${_notFoundIds.join(", ")}] not found',
              style: TextStyle(color: ThemeData.light().errorColor)),
          subtitle: const Text(
              'This app needs special configuration to run. Please see example/README.md for instructions.')));
    }

    // This loading previous purchases code is just a demo. Please do not use this as it is.
    // In your app you should always verify the purchase data using the `verificationData` inside the [PurchaseDetails] object before trusting it.
    // We recommend that you use your own server to verify the purchase data.
    final Map<String, PurchaseDetails> purchases =
        Map<String, PurchaseDetails>.fromEntries(
            _purchases.map((PurchaseDetails purchase) {
      if (purchase.pendingCompletePurchase) {
        _inAppPurchase.completePurchase(purchase).then((value) async {
          print(""
              "completed purchase:\n");
          print("product id: ${purchase.productID}\n");
          print("purchase id: ${purchase.purchaseID}\n");
          print("status: ${purchase.status}\n");
          print("error: ${purchase.error}\n");
          print("transaction data: ${purchase.transactionDate}\n");
          print("pending complete purchase: ${purchase.pendingCompletePurchase}\n");
          print("local verification data source: ${purchase.verificationData.source}\n");
         bool success =  await Provider.of<HomeProvider>(context).makeUserSubscribed();
       if (!success){
         _inAppPurchase.restorePurchases(applicationUserName: null);
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("something_error".tr())));
       }
       else{
         Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
         await Provider.of<HomeProvider>(context).getCurrentUser();
       }

          // bool success =  await Provider.of<HomeProvider>(context).makeUserSubscribed();
          // if (success){
          //   Navigator.of(context).pushReplacementNamed(LaunchScreen.routeName);
          // }else{
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("something_error".tr())));
          // }
         
        });
      }
      return MapEntry<String, PurchaseDetails>(purchase.productID, purchase);
    }));
    productList.addAll(_products.map(
      (ProductDetails productDetails) {
        final PurchaseDetails previousPurchase = purchases[productDetails.id];
        return ListTile(
          title: Text(
            //productDetails.title,
            "subscribe_in_schedule_salary_app".tr(),
          ),
          subtitle: Text(
            //productDetails.description,
            "subscribe_in_app_permanently".tr(),
          ),
          trailing: previousPurchase != null
              ? IconButton(
                  onPressed: () => confirmPriceChange(context),
                  icon: const Icon(Icons.upgrade))
              : TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    primary: Colors.white,
                  ),
                  onPressed: () async {
                    PurchaseParam purchaseParam;

                    if (Platform.isAndroid) {
                      // NOTE: If you are making a subscription purchase/upgrade/downgrade, we recommend you to
                      // verify the latest status of you your subscription by using server side receipt validation
                      // and update the UI accordingly. The subscription purchase status shown
                      // inside the app may not be accurate.

                      // final GooglePlayPurchaseDetails oldSubscription =
                      //     _getOldSubscription(productDetails, purchases);

                      final oldSubscription = null;
                      purchaseParam = GooglePlayPurchaseParam(
                          productDetails: productDetails,
                          applicationUserName: null,
                          changeSubscriptionParam: (oldSubscription != null)
                              ? ChangeSubscriptionParam(
                                  oldPurchaseDetails: oldSubscription,
                                  prorationMode:
                                      ProrationMode.immediateWithTimeProration,
                                )
                              : null);
                    } else {
                      purchaseParam = PurchaseParam(
                        productDetails: productDetails,
                        applicationUserName: null,
                      );
                    }

                    if (productDetails.id == _kConsumableId) {
                    bool result =  await _inAppPurchase.buyConsumable(
                          purchaseParam: purchaseParam,
                          autoConsume: _kAutoConsume || Platform.isIOS);
                      print('--------------------------------\nbuying consumable:\nresult:$result');
                      _inAppPurchase.purchaseStream.listen((event) {
                        print('listening to consumable purchase stream:\n');
                        event.forEach((element) async {
                          await FirebaseFirestore.instance.collection("Test2").add({
                            "type":"buying consumable",
                            "product id":element.productID,
                            "purchase id": element.purchaseID,
                            "status": element.status,
                            "error": element.error,
                            "transaction data": element.transactionDate,
                            "pending complete purchase": element.pendingCompletePurchase,
                            "local verification data source": element.verificationData.source
                          });
                          print("product id: ${element.productID}\n");
                          print("purchase id: ${element.purchaseID}\n");
                          print("status: ${element.status}\n");
                          print("error: ${element.error}\n");
                          print("transaction data: ${element.transactionDate}\n");
                          print("pending complete purchase: ${element.pendingCompletePurchase}\n");
                          print("local verification data source: ${element.verificationData.source}\n");
                        });
                      });
                    } else {
                      bool result = await _inAppPurchase.buyNonConsumable(
                          purchaseParam: purchaseParam);

                      print('--------------------------------\nbuying non consumable:\nresult:$result');
                      _inAppPurchase.purchaseStream.listen((event) {
                        print('listening to non consumable purchase stream:\n');
                        event.forEach((element) async {
                          await FirebaseFirestore.instance.collection("Test2").add({
                            "type":"buying non consumable",
                             "product id":element.productID,
                             "purchase id": element.purchaseID,
                             "status": element.status,
                             "error": element.error,
                           "transaction data": element.transactionDate,
                           "pending complete purchase": element.pendingCompletePurchase,
                           "local verification data source": element.verificationData.source
                           });
                          print("product id: ${element.productID}\n");
                          print("purchase id: ${element.purchaseID}\n");
                          print("status: ${element.status}\n");
                          print("error: ${element.error}\n");
                          print("transaction data: ${element.transactionDate}\n");
                          print("pending complete purchase: ${element.pendingCompletePurchase}\n");
                          print("local verification data source: ${element.verificationData.source}\n");
                        });
                      });
                    }
                  },
                  child: Text(productDetails.price),
                ),
        );
      },
    ));

    return Card(
        child: Column(
            children: <Widget>[productHeader, const Divider()] + productList));
  }

  // Card _buildConsumableBox() {
  //   if (_loading) {
  //     return  Card(
  //         child: ListTile(
  //             leading: CircularProgressIndicator(),
  //             title: Text('loading'.tr())));
  //   }
  //   if (!_isAvailable || _notFoundIds.contains(_kConsumableId)) {
  //     return const Card();
  //   }
  //   const ListTile consumableHeader =
  //       ListTile(title: Text('Purchased consumables'));
  //   final List<Widget> tokens = _consumables.map((String id) {
  //     return GridTile(
  //       child: IconButton(
  //         icon: const Icon(
  //           Icons.stars,
  //           size: 42.0,
  //           color: Colors.orange,
  //         ),
  //         splashColor: Colors.yellowAccent,
  //         onPressed: () => consume(id),
  //       ),
  //     );
  //   }).toList();
  //   return Card(
  //       child: Column(children: <Widget>[
  //     consumableHeader,
  //     const Divider(),
  //     GridView.count(
  //       crossAxisCount: 5,
  //       shrinkWrap: true,
  //       padding: const EdgeInsets.all(16.0),
  //       children: tokens,
  //     )
  //   ]));
  // }

  Widget _buildRestoreButton() {
    if (_loading) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              primary: Colors.white,
            ),
            onPressed: () => _inAppPurchase.restorePurchases(),
            child: const Text('Restore purchases'),
          ),
        ],
      ),
    );
  }

  Future<void> consume(String id) async {
    await ConsumableStore.consume(id);
    final List<String> consumables = await ConsumableStore.load();
    setState(() {
      _consumables = consumables;
    });
  }

  void showPendingUI() {
    setState(() {
      _purchasePending = true;
    });
  }

  Future<void> deliverProduct(PurchaseDetails purchaseDetails) async {
    // IMPORTANT!! Always verify purchase details before delivering the product.
    if (purchaseDetails.productID == _kConsumableId) {
      await ConsumableStore.save(purchaseDetails.purchaseID);
      final List<String> consumables = await ConsumableStore.load();
      setState(() {
        _purchasePending = false;
        _consumables = consumables;
      });
    } else {
      setState(() {
        _purchases.add(purchaseDetails);
        _purchasePending = false;
      });
    }
  }

  void handleError(IAPError error) {
    setState(() {
      _purchasePending = false;
    });
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    // IMPORTANT!! Always verify a purchase before delivering the product.
    // For the purpose of an example, we directly return true.
    return Future<bool>.value(true);
  }

  void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
    // handle invalid purchase here if  _verifyPurchase` failed.
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        showPendingUI();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          handleError(purchaseDetails.error);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          final bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            deliverProduct(purchaseDetails);
          } else {
            _handleInvalidPurchase(purchaseDetails);
            return;
          }
        }
        if (Platform.isAndroid) {
          if (!_kAutoConsume && purchaseDetails.productID == _kConsumableId) {
            final InAppPurchaseAndroidPlatformAddition androidAddition =
                _inAppPurchase.getPlatformAddition<
                    InAppPurchaseAndroidPlatformAddition>();
            await androidAddition.consumePurchase(purchaseDetails);
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    }
  }

  Future<void> confirmPriceChange(BuildContext context) async {
    if (Platform.isAndroid) {
      final InAppPurchaseAndroidPlatformAddition androidAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
      final BillingResultWrapper priceChangeConfirmationResult =
          await androidAddition.launchPriceChangeConfirmationFlow(
        sku: 'purchaseId',
      );
      if (priceChangeConfirmationResult.responseCode == BillingResponse.ok) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Price change accepted'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            priceChangeConfirmationResult.debugMessage ??
                'Price change failed with code ${priceChangeConfirmationResult.responseCode}',
          ),
        ));
      }
    }
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iapStoreKitPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iapStoreKitPlatformAddition.showPriceConsentIfNeeded();
    }
  }

// GooglePlayPurchaseDetails _getOldSubscription(
//     ProductDetails productDetails, Map<String, PurchaseDetails> purchases) {
//   // This is just to demonstrate a subscription upgrade or downgrade.
//   // This method assumes that you have only 2 subscriptions under a group, 'subscription_silver' & 'subscription_gold'.
//   // The 'subscription_silver' subscription can be upgraded to 'subscription_gold' and
//   // the 'subscription_gold' subscription can be downgraded to 'subscription_silver'.
//   // Please remember to replace the printic of finding the old subscription Id as per your app.
//   // The old subscription is only required on Android since Apple handles this internally
//   // by using the subscription group feature in iTunesConnect.
//   GooglePlayPurchaseDetails oldSubscription;
//   if (productDetails.id == _kSilverSubscriptionId &&
//       purchases[_kGoldSubscriptionId] != null) {
//     oldSubscription =
//         purchases[_kGoldSubscriptionId] as GooglePlayPurchaseDetails;
//   } else if (productDetails.id == _kGoldSubscriptionId &&
//       purchases[_kSilverSubscriptionId] != null) {
//     oldSubscription =
//         purchases[_kSilverSubscriptionId] as GooglePlayPurchaseDetails;
//   }
//   return oldSubscription;
// }
}

/// Example implementation of the
/// [`SKPaymentQueueDelegate`](https://developer.apple.com/documentation/storekit/skpaymentqueuedelegate?language=objc).
///
/// The payment queue delegate can be implementated to provide information
/// needed to complete transactions.
class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}
