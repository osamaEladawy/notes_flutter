import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fb_notes/core/constant/constes.dart';
import 'package:flutter_fb_notes/core/functions/back.dart';
import 'package:flutter_fb_notes/core/functions/navigation.dart';
import 'package:flutter_fb_notes/core/functions/snack_bar.dart';
import 'package:flutter_fb_notes/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:flutter_fb_notes/notes/presentation/pages/home/home_page.dart';

class EditNoteViewModel {
  late TextEditingController title;
  late TextEditingController content;
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();

  late String note_title, note_content;
  late Timestamp creation_date;

  void editNote(context, id) {
    BlocProvider.of<NotesCubit>(context).updateNote(
      id,
      note_title.trim(),
      note_content.trim(),
    );
    snackBar(
      context,
      Text(
        "this note is update now ",
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    back(context);
    replacePage(context, HomePage());
  }
}
