
import '../../../model/MonthList.dart';
import '../../../storage/db_operations.dart';
import '../../../storage/db_provider.dart';
import 'package:sqflite/sqflite.dart';

class ExpencesDbController extends DbOperations<Expences> {
  Database _database;

  ExpencesDbController() : _database = DBProvider().database;

  @override
  Future<int> create(Expences data) {
    // TODO: implement create
    return _database.insert(Expences.TABLE_NAME, data.toMap());
  }

  void createMulti(List<Expences> data) {
    // TODO: implement create
    int count = 0;
    data.forEach((element) {
      count++;
      _database.insert(Expences.TABLE_NAME, element.toMap());
    });
  }



  @override
  Future<bool> update(Expences data) async {
    // TODO: implement update
    int countOfUpdatedRows = await _database.update(Expences.TABLE_NAME, data.toMap(),
        where: 'id = ?', whereArgs: [data.id]);
    return countOfUpdatedRows > 0;
  }

  @override
  Future<List<Expences>> read() async {
    // TODO: implement read
    var rowsMaps = await _database.query(Expences.TABLE_NAME);
    return rowsMaps.map((rowMap) => Expences.fromMap(rowMap)).toList();
  }

  @override
  Future<bool> delete(int id) async {
    // TODO: implement delete
    int deleteRowsCount = await _database
        .delete(Expences.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return deleteRowsCount != 0;
  }
  Future<void> deleteAll() async {
    // TODO: implement delete
    await _database
        .execute("delete from Expences");
    return true;
  }

  @override
  Future<Expences> show(int id) {
    // TODO: implement show
    throw UnimplementedError();
  }

}