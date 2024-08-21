import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_fb_notes/notes/data/remote/models/model_note.dart';
import 'package:flutter_fb_notes/notes/domin/use_case/create_note.dart';
import 'package:flutter_fb_notes/notes/domin/use_case/delete_note.dart';
import 'package:flutter_fb_notes/notes/domin/use_case/get_note_by_id.dart';
import 'package:flutter_fb_notes/notes/domin/use_case/get_notes.dart';
import 'package:flutter_fb_notes/notes/domin/use_case/update_note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final CreateNote _createNote;
  final DeleteNote _deleteNote;
  final GetNotes _getNotes;
  final UpdateNote _updateNote;
  final GetNoteById _getNoteById;

  NotesCubit(
      {required CreateNote createNote,
      required DeleteNote deleteNote,
      required GetNotes getNotes,
      required UpdateNote updateNote,
      required GetNoteById getNoteById})
      : _createNote = createNote,
        _deleteNote = deleteNote,
        _getNotes = getNotes,
        _updateNote = updateNote,
        _getNoteById = getNoteById,
        super(NotesInitial());

  Future<void> createNote(Notes notes) async {
    try {
      await _createNote.call(notes);
      emit(NotesSuccess());
    } catch (e) {
      emit(NotesError(messageError: e.toString()));
    }
  }

  Future<void> updateNote(
     String noteId ,String title, String  content) async {
    try {
      await _updateNote.call(noteId,title,content);
      emit(NotesSuccess());
    } catch (e) {
      emit(NotesError(messageError: e.toString()));
    }
  }

  Future<void> deleteNote(String noteId) async {
    try {
      await _deleteNote.call(noteId);
    } catch (e) {
      emit(NotesError(messageError: e.toString()));
    }
  }

  Future<void> getAllNotes() async {
    try {
      emit(NotesLoading());
      final notes = _getNotes.call();
      notes!.listen((value) {
        emit(NotesLoaded(notes: value));
      });
    } catch (e) {
      emit(NotesError(messageError: e.toString()));
    }
  }

  Future<void> getNoteById(String id) async {
    try {
      await _getNoteById.call(id);
    } catch (e) {
      emit(NotesError(messageError: e.toString()));
    }
  }
}
