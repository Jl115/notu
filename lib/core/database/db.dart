import 'package:notu/core/database/models/note_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite_common/sqflite.dart'; // to access databaseFactory
import 'package:path/path.dart';

class AppDatabase {
  static Database? _db;

  static Future<Database> get instance async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    final dbPath = await databaseFactory.getDatabasesPath();
    final path = join(dbPath, 'notu.db');

    if (kDebugMode) {
      await databaseFactory.deleteDatabase(path);
    }

    return await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) async {
          await db.execute(NoteModel.createTable);
        },
      ),
    );
  }
}
