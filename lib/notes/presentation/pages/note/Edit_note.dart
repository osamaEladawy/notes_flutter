import 'package:flutter/material.dart';
import 'package:flutter_fb_notes/notes/data/remote/models/model_note.dart';
import 'package:flutter_fb_notes/shared/laeding_appBar.dart';
import 'package:flutter_fb_notes/notes/presentation/widgets/edit_note/show_date.dart';
import 'package:flutter_fb_notes/notes/presentation/widgets/edit_note/text_field.dart';
import 'package:flutter_fb_notes/shared/title_app_bar.dart';
import 'package:flutter_fb_notes/view_model/edit_note_view_model.dart';
import 'package:intl/intl.dart';

class NoteEdit extends StatefulWidget {
  final Notes note;

  const NoteEdit({super.key, required this.note});

  @override
  State<NoteEdit> createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
  EditNoteViewModel _model = EditNoteViewModel();

  @override
  void initState() {
    super.initState();
    _model.title = TextEditingController(text: widget.note.noteTitle);
    _model.content = TextEditingController(text: widget.note.noteContent);

    _model.note_title = widget.note.noteTitle;
    _model.note_content = widget.note.noteContent;
    _model.creation_date = widget.note.date;
  }

  @override
  void dispose() {
    _model.title.dispose();
    _model.content.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //int color_id = Random().nextInt(AppStyle.cardsColor.length);
    return Scaffold(
      //backgroundColor: AppStyle.cardsColor[_model.color_id],
      //backgroundColor: Colors.yellow,
      appBar: AppBar(
        //backgroundColor: AppStyle.cardsColor[_model.color_id],
        title: TitleAppBar(
          title: "Update Notes",
        ),
        leadingWidth: 100,
        leading: LeadingAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: _model.title,
              isContent: false,
              hintText: _model.note_title,
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    _model.note_title = value;
                  }
                });
              },
            ),
            const SizedBox(height: 8.0),
            ShowDate(
              title:
                  "${DateFormat.yMMMd().format(_model.creation_date.toDate())} ${DateFormat.jm().format(_model.creation_date.toDate())}",
            ),
            const SizedBox(height: 30),
            Expanded(
                child: SingleChildScrollView(
              child: CustomTextField2(
                controller: _model.content,
                hintText: _model.note_content,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      _model.note_content = value;
                    }
                  });
                },
              ),
            ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        //backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          _model.editNote(context, "${widget.note.id}");
        },
        label: const Text("Save"),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
