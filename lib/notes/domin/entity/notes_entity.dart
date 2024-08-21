// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class NotesEntity extends Equatable {
  String? id;
  int? color_id;
  final date;
  String note_content;
  String note_title;

  NotesEntity({
    this.id = '',
    this.color_id,
    required this.date,
    required this.note_content,
    required this.note_title,
  });

  @override
  List<Object?> get props => [
        id,
        color_id,
        date,
        note_content,
        note_title,
      ];
}
