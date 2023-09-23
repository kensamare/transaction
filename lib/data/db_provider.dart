import 'dart:math';

import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  Database? _database;

  static final DBProvider instance = DBProvider._init();

  DBProvider._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('transaction.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
create table transactions ( 
  id integer primary key autoincrement, 
   sum integer,
   commission real,
   date text,
   type integer)
''');

    String date = DateFormat('dd.MM.yyyy').format(DateTime.now());
    for (int i = 0; i < 30; i++) {
      int sum = _getRandomInt(100, 1000);
      double commission = _getRandomDouble(0, 20);

      int type = _getRandomInt(0, 2);

      await db.rawInsert(
          'INSERT INTO transactions (sum, commission, date, type) '
              'VALUES (?, ?, ?, ?)',
          [sum, commission, date, type]);
    }
  }

  Future<List<Map<String, dynamic>>> select() async {
    try {
      final db = await database;
      List<Map<String, dynamic>> transactions = await db.query('transactions');
      return _toJsonFormat(transactions);
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  List<Map<String, dynamic>>  _toJsonFormat(List<Map<String, dynamic>> data) {
    List<Map<String, dynamic>> formattedData = [];

    for (var transaction in data) {
      Map<String, dynamic> formattedTransaction = {
        'id': transaction['id'],
        'sum': transaction['sum'],
        'commission': transaction['commission'],
        'date': transaction['date'],
        'type': transaction['type'],
      };

      formattedData.add(formattedTransaction);
    }
    return formattedData;
  }

  Future<void> delete({required int id}) async {
    try {
      final db = await database;
      db.delete('transactions', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print(e.toString());
    }
  }

  int _getRandomInt(int min, int max) => Random().nextInt(max - min + 1) + min;

  double _getRandomDouble(double min, double max) {
    double randomValue = min + Random().nextDouble() * (max - min);
    return double.parse(randomValue.toStringAsFixed(2));
  }
}
