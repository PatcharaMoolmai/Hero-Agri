import 'dart:async';

import 'package:hero_agri/database/local_database.dart';
import 'package:sqflite/sqflite.dart';

class UserProfile {
  UserProfile(this.localDatabase);

  final LocalDatabase localDatabase;

  static const String USER_PROFILE_TABLE = 'user_profile';

  static const String USER_ID = '_uid';
  static const String USER_TEL = 'tel';
  static const String USER_NAME = 'name';
  static const String USER_PASSWORD = 'password';
  static const String USER_EMAIL = 'email';
  static const String USER_HABITAT = 'habitat';

  static FutureOr<void> onCreate(final Database db, final int version) async {
    await db.execute('create table $USER_PROFILE_TABLE('
        '$USER_ID INTEGER PRIMARY KEY,'
        '$USER_TEL INTEGER NOT NULL,'
        '$USER_NAME TEXT NOT NULL,'
        '$USER_PASSWORD TEXT NOT NULL,'
        '$USER_EMAIL TEXT,'
        '$USER_HABITAT TEXT,'
        ')');
  }
}
