import 'package:flutter_fb_notes/notes/data/local/models/note_model.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class DataSourceLocalStorage {
  Future<Database?> createDataBase();
  Future<int> createNote(Notes note);
  Future<int> updateNote(Notes note);
  Future<int> deleteNote(int id);
  Future readAllNotes();
}
