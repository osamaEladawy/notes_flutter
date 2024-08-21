import 'package:flutter_fb_notes/notes/data/remote/models/model_note.dart';

abstract class DataSourceRemote {
  Future<Notes?> createNotes(Notes notes);
  Future<Notes?> getNoteById(String id);
  Stream<List<Notes>>? getAllNotes();
  Future<Notes?> updateNotesById(String noteId ,String title, String  content);
  Future<String?> deleteNotesById(String docs);
}

