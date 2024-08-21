
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fb_notes/notes/notes_injection.dart';
import 'package:get_it/get_it.dart';
final sl = GetIt.instance;

Future<void> init() async {

  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => fireStore);
  
  await notesInjection();
}