import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fb_notes/notes/data/remote/data_source/data_source_remote.dart';
import 'package:flutter_fb_notes/notes/data/remote/models/model_note.dart';

class DataSourceRemoteImport extends DataSourceRemote {
  @override
  Future<Notes?> createNotes(Notes notes) async {
    final instanceFRomData =
        FirebaseFirestore.instance.collection("Notes").doc();
    notes.id = instanceFRomData.id;
    final json = notes.toJson();
    await instanceFRomData.set(json);
    return null;
  }

  @override
  Future<String?> deleteNotesById(String docs) async {
    final instanceFromData =
        FirebaseFirestore.instance.collection("Notes").doc(docs);
    await instanceFromData.delete();
    return null;
  }

  @override
  Stream<List<Notes>>? getAllNotes() => FirebaseFirestore.instance
      .collection('Notes')
      .snapshots()
      .map((event) => event.docs
          .map((e) => Notes.fromSnapshot(
                e.data(),
              ))
          .toList());

  @override
  Future<Notes?> getNoteById(String id) async {
    final instanceFromData =
        FirebaseFirestore.instance.collection("Notes").doc(id);
    final snapshot = await instanceFromData.get();
    if (snapshot.exists) {
      return Notes.fromSnapshot(snapshot.data()!);
    }
    return null;
  }

  @override
  Future<Notes?> updateNotesById(String id,String title,String content) async {
    DocumentReference instanceFromData =
        FirebaseFirestore.instance.collection("Notes").doc("${id}");
    id = instanceFromData.id;
    instanceFromData.update({
      'note_title': title,
      'note_content': content,
    });
    return null;
  }
}
