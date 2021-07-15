// Flutter import
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hero_agri/database/news_database.dart';
import 'package:hero_agri/database/user_profile_database.dart';

// Package import
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

// Project import

// Combine all database
class LocalDatabase extends ChangeNotifier {
  // Create database constructure
  LocalDatabase._(final Database database) : _database = database;
  final Database _database;

  Database get database => _database;

  @override
  void notifyListeners() => super.notifyListeners();

  // Name of database right here
  static final _databaseName = "AgriHeroLocalDatabase.db";

  // Create database (if exist find it)
  static Future<LocalDatabase> getLocalDatabase() async {
    final String databasesRootPath = await getDatabasesPath();
    final String databasePath = join(databasesRootPath, _databaseName);
    print('DB path is ' + databasePath);
    final Database database = await openDatabase(databasePath,
        version: 3,
        singleInstance: true,
        // onUpgrade: _onUpgrade,
        onCreate: _onCreate);
    return LocalDatabase._(database);
  }

  // onCreate function
  static FutureOr<void> _onCreate(Database db, int version) async {
    print('Create database');
    await UserProfile.onCreate(db, version);
    await NewsDatabase.onCreate(db, version);
  }
  // FutureOr<void> _onCreate(Database db, int oldNersion, int oldNersion) async {}
}
