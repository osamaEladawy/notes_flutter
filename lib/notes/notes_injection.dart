import 'package:flutter_fb_notes/main_injection_container.dart';
import 'package:flutter_fb_notes/notes/data/remote/data_source/data_source_remote.dart';
import 'package:flutter_fb_notes/notes/data/remote/data_source/data_source_remote_imp.dart';
import 'package:flutter_fb_notes/notes/data/repository/repository_imp.dart';
import 'package:flutter_fb_notes/notes/domin/repository/repository.dart';
import 'package:flutter_fb_notes/notes/domin/use_case/create_note.dart';
import 'package:flutter_fb_notes/notes/domin/use_case/delete_note.dart';
import 'package:flutter_fb_notes/notes/domin/use_case/get_note_by_id.dart';
import 'package:flutter_fb_notes/notes/domin/use_case/get_notes.dart';
import 'package:flutter_fb_notes/notes/domin/use_case/update_note.dart';
import 'package:flutter_fb_notes/notes/presentation/manager/cubit/notes_cubit.dart';

Future<void> notesInjection() async {
  // * CUBITS INJECTION

  sl.registerFactory<NotesCubit>(
    () => NotesCubit(
      createNote: sl.call(),
      deleteNote: sl.call(),
      getNotes: sl.call(),
      updateNote: sl.call(),
      getNoteById: sl.call(),
    ),
  );

  // * USE CASES INJECTION

  sl.registerLazySingleton<UpdateNote>(() => UpdateNote(repository: sl.call()));

  sl.registerLazySingleton<DeleteNote>(() => DeleteNote(repository: sl.call()));

  sl.registerLazySingleton<GetNotes>(() => GetNotes(repository: sl.call()));

  sl.registerLazySingleton<GetNoteById>(
      () => GetNoteById(repository: sl.call()));

  sl.registerLazySingleton<CreateNote>(() => CreateNote(repository: sl.call()));

  // * REPOSITORY & DATA SOURCES INJECTION

  sl.registerLazySingleton<Repository>(
    () => RepositoryImp(
      dataSourceRemote: sl.call(),
    ),
  );
  sl.registerLazySingleton<DataSourceRemote>(() => DataSourceRemoteImport());
}
