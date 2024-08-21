// ignore_for_file: must_be_immutable

import 'package:flutter_fb_notes/notes/domin/entity/notes_entity.dart';

class Notes extends NotesEntity {
  final String? id;
  final int? color_id;
  final date;
  final String note_content;
  final String note_title;

  Notes({
    this.id = '',
    this.color_id,
    required this.date,
    required this.note_content,
    required this.note_title,
  }) : super(
            id: id,
            color_id: color_id,
            date: date,
            note_content: note_content,
            note_title: note_title);

  factory Notes.fromSnapshot(Map<String, dynamic> documents) {
    //final data = documents.data();
    return Notes(
      id: documents['id'],
      color_id: documents["color_id"],
      date: documents["date"],
      note_content: documents["note_content"],
      note_title: documents['note_title'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        "color_id": color_id,
        "date": date,
        "note_content": note_content,
        "note_title": note_title,
      };

  int? get colorId => color_id;
  String get noteContent => note_content;
  String get noteTitle => note_title;

  set colorId(int? id) => color_id;
  set noteContent(String content) => note_content;
  set noteTitle(String title) => note_title;
}

