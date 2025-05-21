import 'package:notu/app/entity/note/whiteboard_text_block.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite_common/sqflite.dart'; // to access databaseFactory
import 'package:notu/core/database/models/note_model.dart';
import 'package:notu/core/database/models/category_model.dart';
import 'package:notu/core/database/models/note_text_block_model.dart';
import 'package:notu/core/database/models/whiteboard_text_model.dart';
import 'package:notu/core/database/models/whiteboard_block_model.dart';

class AppDatabase {
  static Database? _db;
  //* Increment this version number whenever you change the database schema
  static int _version = 1;

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
    print('\x1B[32mpath -------------------- ${path}\x1B[0m');
    return await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: _version, // Increment this when you change schema
        onCreate: (db, version) async {
          //* TABLES
          await db.execute('PRAGMA foreign_keys = ON');
          await db.execute(CategoryModel.createTable);
          await db.execute(NoteModel.createTable);
          await db.execute(NoteTextBlockModel.createTable);
          await db.execute(WhiteboardTextModel.createTable);
          await db.execute(WhiteboardBlockModel.createTable);
          //* SEEDERS
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          if (kDebugMode) {
            print('Upgrading database from version $oldVersion to $newVersion');
          }
          //* MIGRATIONS
          if (oldVersion < _version + 1) {
            // Example: Add a new column
            // await db.execute('ALTER TABLE note ADD COLUMN pinned INTEGER DEFAULT 0');
            // Add new tables, update structure, etc.
          }
          // Add further version checks as you grow.
        },
        onDowngrade: (db, oldVersion, newVersion) async {
          // Optional: Handle downgrade logic or just use onDowngrade: onDatabaseDowngradeDelete
        },
      ),
    );
  }
}
