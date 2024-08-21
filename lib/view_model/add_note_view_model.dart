import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fb_notes/core/constant/constes.dart';
import 'package:flutter_fb_notes/core/functions/back.dart';
import 'package:flutter_fb_notes/core/functions/navigation.dart';
import 'package:flutter_fb_notes/core/functions/snack_bar.dart';
import 'package:flutter_fb_notes/notes/data/remote/models/model_note.dart';
import 'package:flutter_fb_notes/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:flutter_fb_notes/notes/presentation/pages/home/home_page.dart';

class AddNoteViewModel {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  int colorId = Random().nextInt(AppStyle.cardsColor.length);
  var date = Timestamp.now();

  void addNote(context) {
    if (title.text.trim().isNotEmpty && content.text.trim().isNotEmpty) {
      final notes = Notes(
          date: date,
          note_content: content.text,
          note_title: title.text,
          color_id: colorId);

      BlocProvider.of<NotesCubit>(context).createNote(notes);
      snackBar(
          context,
          Text(
            "created new note",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ));
      back(context);
      replacePage(context, HomePage());
    }
  }
}
