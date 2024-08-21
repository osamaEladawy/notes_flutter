import 'package:flutter_fb_notes/notes/data/remote/data_source/data_source_remote.dart';
import 'package:flutter_fb_notes/notes/data/remote/models/model_note.dart';
import 'package:flutter_fb_notes/notes/domin/repository/repository.dart';

class RepositoryImp extends Repository {
  final DataSourceRemote _dataSourceRemote;

  RepositoryImp({required DataSourceRemote dataSourceRemote}) : _dataSourceRemote = dataSourceRemote;
  @override
  Future<Notes?> createNotes(Notes notes) async {
  return _dataSourceRemote.createNotes(notes);
  }

  ///create news with the second time
  @override
  Future<Notes?> getNoteById(String id) async {
   return await _dataSourceRemote.getNoteById(id);
  }

  ///this method uses to read the news
  @override
  Stream<List<Notes>>? getAllNotes() => _dataSourceRemote.getAllNotes();
  
  @override
  Future<Notes?> updateNotesById(String noteId ,String title, String  content) async {
   return await _dataSourceRemote.updateNotesById(noteId ,title,content);
  }
  
  @override
  Future<String?> deleteNotesById(String docs) async {
   return await _dataSourceRemote.deleteNotesById(docs);
  }

}
