import 'package:flutter_fb_notes/core/functions/check_internet.dart';
import 'package:flutter_fb_notes/notes/data/remote/models/model_note.dart';

abstract class Repository {
  Future<Notes?> createNotes(Notes notes);
  Future<Notes?> getNoteById(String id);
  Stream<List<Notes>>? getAllNotes();
  Future<Notes?> updateNotesById(String noteId, String title, String content);
  Future<String?> deleteNotesById(String docs);

  void dataSource(){
    if(checkInternet()){
      // TODO: Implement data source when internet is available
    }else{
      // TODO: Implement data source when internet is not available
    }
  }
}
