import 'package:flutter_fb_notes/notes/domin/repository/repository.dart';

class DeleteNote{
  final Repository _repository;

  DeleteNote({required Repository repository}) : _repository = repository;
  Future<String?> call(String noteId) async {
   return await _repository.deleteNotesById(noteId);
  }
}