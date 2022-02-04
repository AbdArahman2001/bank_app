
import 'package:bank_app_flutter/model/MonthList.dart';
import 'package:bank_app_flutter/storage/db_operations.dart';
import 'package:bank_app_flutter/storage/db_provider.dart';
import 'package:sqflite/sqflite.dart';

class MonthListDbController extends DbOperations<MonthList> {
  Database _database;

  MonthListDbController() : _database = DBProvider().database;

  @override
  Future<int> create(MonthList data) {
    // TODO: implement create
    return _database.insert(MonthList.TABLE_NAME, data.toMap());
  }

  @override
  Future<bool> update(MonthList data) async {
    // TODO: implement update
    int countOfUpdatedRows = await _database.update(MonthList.TABLE_NAME, data.toMap(),
        where: 'id = ?', whereArgs: [data.id]);
    return countOfUpdatedRows > 0;
  }

  @override
  Future<List<MonthList>> read() async {
    // TODO: implement read
    List<Map<String, dynamic>> data = await _database.query(MonthList.TABLE_NAME);
    if (data.isNotEmpty) {
      return data.map((rowMap) => MonthList.fromMap(rowMap)).toList();
    }
    return [];
  }

  @override
  Future<bool> delete(int id) async {
    // TODO: implement delete
    int deleteRowsCount = await _database
        .delete(MonthList.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return deleteRowsCount != 0;
  }

  @override
  Future<MonthList> show(int id) async {
    // TODO: implement show
    var data = await _database
        .query(MonthList.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return data.isNotEmpty
        ? data.map((rowMap) => MonthList.fromMap(rowMap)).first
        : null;
  }


  Future<List<Map<String, dynamic>>> getItem(int id) async {
    return _database.query(MonthList.TABLE_NAME, where: "id = ?", whereArgs: [id], limit: 1);
  }
  // Future<bool> deleteUserCategories(int userId) async {
  //   int deleteRowsCount = await _database
  //       .delete('monthList', where: 'user_id = ?', whereArgs: [userId]);
  //   return deleteRowsCount > 0;
  // }
}