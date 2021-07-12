import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hero_agri/database/local_database.dart';
import 'package:sqflite/sqflite.dart';

class NewsDatabase extends ChangeNotifier {
  
  // Constructor
  NewsDatabase(this.localDatabase);
  
  final LocalDatabase localDatabase;

  // Create Table
  static const String USER_NEWS_TABLE = 'news_database';

  static const String NEWS_ID = 'news_id';
  static const String NEWS_TITLE = 'news_title';
  static const String NEWS_DESCRIPTION = 'news_desc';
  static const String NEWS_TIMESTAMP = 'news_timestamp';

  // Create Database
  static FutureOr<void> onCreate(final Database db, final int version) async {
    await db.execute('create table $USER_NEWS_TABLE('
        '$NEWS_ID INTEGER PRIMARY KEY,'
        '$NEWS_TITLE TEXT NOT NULL,'
        '$NEWS_DESCRIPTION TEXT NOT NULL,'
        '$NEWS_TIMESTAMP TEXT NOT NULL'
        ')');
  }

  // Database Process
}