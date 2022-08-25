import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';

class AppUser{
  String id;
  String name;
  String email;
  Timestamp registeringDate;
bool isSubscribed;
  AppUser({this.id,this.name,this.email,this.registeringDate,this.isSubscribed});
  AppUser.fromJson(Map<String,dynamic> map){
    id = map["id"];
    name = map["name"];
    email = map["email"];
    registeringDate = map["registeringDate"];
    isSubscribed = map["isSubscribed"];
  }
  Map<String,dynamic> toJson(){
    Map<String,dynamic> map = {};
    map["id"] = id;
    map["name"] = name;
    map["email"] = email;
    map["registeringDate"] = registeringDate;
    map["isSubscribed"] = isSubscribed;
    return map;
  }

}
enum SubscriptionPackage { Month, Year, Forever }
extension Amount on SubscriptionPackage {
  double getAmount(){
    switch(this){
      case SubscriptionPackage.Month:
        return 1.0;
      case SubscriptionPackage.Year:
        return 8.0;
      case SubscriptionPackage.Forever:
        return 24.0;

      default:
        return 1.0;
    }
  }
  String getLabel(){
    switch(this){
      case SubscriptionPackage.Month:
       return "month_subscription".tr();
      case SubscriptionPackage.Year:
        return "year_subscription".tr();
      case SubscriptionPackage.Forever:
        return "forever_subscription".tr();
      default:
        return "month_subscription".tr();
    }
  }
}
String fromSubscriptionToString(SubscriptionPackage package){
  return package.name.tr();
}
SubscriptionPackage fromStringToSubscription(String subscription){
switch(subscription){
  case "Month":
    return SubscriptionPackage.Month;
  case "Year":
    return SubscriptionPackage.Year;
  case "Forever":
    return SubscriptionPackage.Forever;
  default :
    return SubscriptionPackage.Month;
}
}
