import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fb_notes/core/constant/constes.dart';
import 'package:flutter_fb_notes/notes/data/local/data_source/data_source_local.dart';
import 'package:flutter_fb_notes/notes/data/local/models/note_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataSourceLocalImp extends DataSourceLocalStorage {
  static Database? _database;

  static final note_title = TextEditingController();
  static final note_content = TextEditingController();
  static final creation_data = TextEditingController();
  static int color_id = Random().nextInt(AppStyle.cardsColor.length);
  static String date = DateTime.now().toString();
  static late Notes notes;

  Database? get dataBase => _database;

  @override
  Future<Database?> createDataBase() async {
    if (_database != null) {
      return _database;
    } else {
      Directory directory = await getApplicationDocumentsDirectory();
      String path = join(directory.path, 'posts.abc');
      _database = await openDatabase(path, version: 1, onCreate: (db, index) {
        db.execute(
            "CREATE TABLE notes ( id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,title TEXT varchar (50),content TEXT varchar(300), date TEXT varchar(30) )");
      });
      return _database;
    }
  }

  @override
  Future<int> createNote(Notes note) async {
    Database? base = await createDataBase();
    return base!.insert('notes', note.toJson());
  }

  Future<List> selectAllNotes() async {
    Database? dataBase = await createDataBase();
    return dataBase!.query('notes');
  }

  @override
  Future readAllNotes() async {
    Database? data = await createDataBase();
    return data!.query('notes');
  }

  @override
  Future<int> deleteNote(int id) async {
    Database? dataBase = await createDataBase();
    return dataBase!.delete('notes', where: 'id = ? ', whereArgs: [id]);
  }

  @override
  Future<int> updateNote(Notes note) async {
    Database? dataBase = await createDataBase();
    return dataBase!
        .update('notes', note.toJson(), where: 'id = ?', whereArgs: [note.id]);
  }
}
