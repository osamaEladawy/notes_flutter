import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fb_notes/notes/data/remote/models/model_note.dart';
import 'package:flutter_fb_notes/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:flutter_fb_notes/shared/laeding_appBar.dart';
import 'package:flutter_fb_notes/shared/title_app_bar.dart';
import 'package:intl/intl.dart';

class ReadNote extends StatefulWidget {
  final Notes notes;
  const ReadNote({super.key, required this.notes});

  @override
  State<ReadNote> createState() => _ReadNoteState();
}

class _ReadNoteState extends State<ReadNote> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getNoteById("${widget.notes.id}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppStyle.cardsColor[widget.notes.colorId!],
      appBar: AppBar(
          title: TitleAppBar(title: "read your notes"),
          //backgroundColor: AppStyle.cardsColor[widget.notes.colorId!],
          elevation: 0.5,
          leadingWidth: 100,
          leading: LeadingAppBar()),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.notes.noteTitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 6.0),
                Center(
                  child: Text(
                    "${DateFormat.yMMMd().format(widget.notes.date.toDate())} ${DateFormat.jm().format(widget.notes.date.toDate())}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(widget.notes.noteContent,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
