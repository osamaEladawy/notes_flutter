import 'package:flutter_fb_notes/notes/data/remote/models/model_note.dart';
import 'package:flutter_fb_notes/notes/domin/repository/repository.dart';

class GetNoteById{
  final Repository _repository;

  GetNoteById({required Repository repository}) : _repository = repository;
  Future<Notes?> call(String id) async {
    return await _repository.getNoteById(id);
  }
}