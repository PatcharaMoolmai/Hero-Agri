import 'dart:async';

import 'package:hero_agri/database/local_database.dart';
import 'package:sqflite/sqflite.dart';

class UserProfile {
  UserProfile(this.localDatabase);

  final LocalDatabase localDatabase;

  // Create Table
  static const String USER_PROFILE_TABLE = 'user_profile';

  static const String USER_ID = '_uid';
  static const String USER_TEL = 'tel';
  static const String USER_NAME = 'name';
  static const String USER_PASSWORD = 'password';
  static const String USER_EMAIL = 'email';
  static const String USER_HABITAT = 'habitat';

  // Create Database
  static FutureOr<void> onCreate(final Database db, final int version) async {
    await db.execute('create table $USER_PROFILE_TABLE('
        '$USER_ID INTEGER PRIMARY KEY,'
        '$USER_TEL INTEGER NOT NULL,'
        '$USER_NAME TEXT NOT NULL,'
        '$USER_PASSWORD TEXT NOT NULL,'
        '$USER_EMAIL TEXT,'
        '$USER_HABITAT TEXT'
        ')');
  }

  // Database Process

  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await localDatabase.database;
    return await db.insert(USER_PROFILE_TABLE, row);
  }

  // update row
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await localDatabase.database;
    int id = row[USER_ID];
    return await db.update(USER_PROFILE_TABLE, row,
        where: '$USER_ID = ?', whereArgs: [id]);
  }

  // query all rows
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await localDatabase.database;
    return await db.query(USER_PROFILE_TABLE);
  }
}
