import 'package:flutter_fb_notes/notes/data/remote/models/model_note.dart';
import 'package:flutter_fb_notes/notes/domin/repository/repository.dart';

class CreateNote {
  final Repository _repository;

  CreateNote({required Repository repository}) : _repository = repository;
  Future<Notes?>call(Notes notes)async{
   return await _repository.createNotes(notes);
  }
}
