import 'package:sqflite/sqflite.dart';

mixin Queries {
 Database dbInstance;


  Future<void> createExpencesTable() async {
    await dbInstance.execute('CREATE TABLE Expences ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'type TEXT,'
        'amount NUMERIC,'
        'total NUMERIC'
        ')');
  }

  Future<void> createMonthListTable() async {
    await dbInstance.execute('CREATE TABLE monthList ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'salaryAmount NUMERIC,'
        'totalCash NUMERIC,'
        'cashAmount NUMERIC,'
        'salaryDate TEXT,'
        'sumExpencesAmount NUMERIC,'
        'sumTotalExpences NUMERIC,'
        'totalMonthly NUMERIC,'
        'mounthlyAmount NUMERIC,'
        'totalSave NUMERIC,'
        'saveAmount NUMERIC,'
        'expences_Id INTEGER,'
        'lang TEXT'
        ')'
    );
  }

  /*String lang;
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
  List<Expences> expences;  */
}
