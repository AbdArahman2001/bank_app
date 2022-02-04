import 'package:bank_app_flutter/model/db_table.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbOperations<T extends DbTable> {
  Database _database;

  Future<int> create(T data);
  // Future<int> create(T data) async {
  //   return await _database.insert((T as DbTable).tableName, data.toMap());
  // }

  Future<List<T>> read();

  // Future<List<T>> read() async{
  //   var rowsMaps = await _database.query((T as DbTable).tableName);
  //   return rowsMaps.map((rowMap) => T.fromMap(rowMap)).toList();
  // }

  Future<T> show(int id);

  Future<bool> update(T data);

  Future<bool> delete(int id);
}
