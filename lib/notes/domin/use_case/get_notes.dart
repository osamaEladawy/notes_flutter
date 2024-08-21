import 'package:flutter_fb_notes/notes/data/remote/models/model_note.dart';
import 'package:flutter_fb_notes/notes/domin/repository/repository.dart';

class GetNotes {
  final Repository _repository;

  GetNotes({required Repository repository}) : _repository = repository;
  Stream<List<Notes>>? call() {
    return _repository.getAllNotes();
  }
}
