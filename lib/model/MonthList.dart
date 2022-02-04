import 'package:bank_app_flutter/model/db_table.dart';
class MonthList extends DbTable{
  int id;
  String lang;
  String salaryDate;
  double salaryAmount;
  double totalCash;
  double cashAmount;
  double sumExpencesAmount;
  double sumTotalExpences;
  double totalMonthly;
  double mounthlyAmount;
  double totalSave;
  double saveAmount;
  int expencessId;
  static const TABLE_NAME = 'monthList';
  List<Expences> expences;

  MonthList(
      {this.lang,
        this.salaryDate,
        this.salaryAmount,
        this.totalCash,
        this.cashAmount,
        this.sumExpencesAmount,
        this.sumTotalExpences,
        this.totalMonthly,
        this.mounthlyAmount,
        this.totalSave,
        this.saveAmount});

  MonthList.fromJson(Map<String, dynamic> json) {
    lang = json['lang'];
    salaryDate = json['salaryDate'];
    salaryAmount = json['salaryAmount'];
    totalCash = json['totalCash'];
    cashAmount = json['cashAmount'];
    sumExpencesAmount = json['sumExpencesAmount'];
    sumTotalExpences = json['sumTotalExpences'];
    totalMonthly = json['totalMonthly'];
    mounthlyAmount = json['mounthlyAmount'];
    totalSave = json['totalSave'];
    saveAmount = json['saveAmount'];
    if (json['expences'] != null) {
      expences = new List<Expences>();
      json['expences'].forEach((v) {
        expences.add(new Expences.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lang'] = this.lang;
    data['salaryDate'] = this.salaryDate;
    data['salaryAmount'] = this.salaryAmount;
    data['totalCash'] = this.totalCash;
    data['cashAmount'] = this.cashAmount;
    data['sumExpencesAmount'] = this.sumExpencesAmount;
    data['sumTotalExpences'] = this.sumTotalExpences;
    data['totalMonthly'] = this.totalMonthly;
    data['mounthlyAmount'] = this.mounthlyAmount;
    data['totalSave'] = this.totalSave;
    data['saveAmount'] = this.saveAmount;
    if (this.expences != null) {
      data['expences'] = this.expences.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString

    return this.toJson().toString();
  }

 MonthList.fromMap(Map<String, dynamic> rowMap) : super.fromMap(rowMap)  {
    lang = rowMap['lang'];
    salaryDate = rowMap['salaryDate'];
    salaryAmount = rowMap['salaryAmount'].toDouble();
    totalCash = rowMap['totalCash'].toDouble();
    cashAmount = rowMap['cashAmount'].toDouble();
    sumExpencesAmount = rowMap['sumExpencesAmount'].toDouble();
    sumTotalExpences = rowMap['sumTotalExpences'].toDouble();
    totalMonthly = rowMap['totalMonthly'].toDouble();
    mounthlyAmount = rowMap['mounthlyAmount'].toDouble();
    totalSave = rowMap['totalSave'].toDouble();
    saveAmount = rowMap['saveAmount'].toDouble();
    expencessId = rowMap['expences_Id'];
    id = rowMap['id'];

  }

 Map<String, dynamic> toMap() {
   Map<String, dynamic> map = Map<String, dynamic>();
   map['lang'] = lang;
   map['salaryDate'] = salaryDate;
   map['salaryAmount'] = salaryAmount;
   map['totalCash'] = totalCash;
   map['cashAmount'] = cashAmount;
   map['sumExpencesAmount'] = sumExpencesAmount;
   map['sumTotalExpences'] = sumTotalExpences;
   map['totalMonthly'] = totalMonthly;
   map['mounthlyAmount'] = mounthlyAmount;
   map['totalSave'] = totalSave;
   map['saveAmount'] = saveAmount;
   map['expences_Id'] = expencessId;

   return map;
 }
}

class Expences  extends DbTable{
  int id;
  String type;
  double amount;
  double total;
  bool isSelect=false;
  static const TABLE_NAME = 'Expences';

  Expences({this.id, this.type, this.amount, this.total,this.isSelect});

  Expences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    amount = json['amount'];
    total = json['total'];
    isSelect = json['isSelect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['total'] = this.total;
    data['isSelect'] = this.isSelect;
    return data;
  }
Expences.fromMap(Map<String, dynamic> rowMap) : super.fromMap(rowMap)  {
    id = rowMap['id'];
    type = rowMap['type'];
    amount = rowMap['amount'].toDouble();
    total = rowMap['total'].toDouble();
    // isSelect = rowMap['isSelect'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['type'] = type;
    data['amount'] = amount;
    data['total'] = total;
    // data['isSelect'] = isSelect;
    return data;
  }

}