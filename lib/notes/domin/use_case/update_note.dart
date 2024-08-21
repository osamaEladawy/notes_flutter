import 'package:flutter_fb_notes/notes/data/remote/models/model_note.dart';
import 'package:flutter_fb_notes/notes/domin/repository/repository.dart';

class UpdateNote {
  final Repository _repository;

  UpdateNote({required Repository repository}) : _repository = repository;
  Future<Notes?> call(String id, String title, String content) async {
    return await _repository.updateNotesById(id, title, content);
  }
}
