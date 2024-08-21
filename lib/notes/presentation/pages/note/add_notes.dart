import 'package:flutter/material.dart';
import 'package:flutter_fb_notes/notes/presentation/widgets/add_note/text_field.dart';
import 'package:flutter_fb_notes/shared/laeding_appBar.dart';
import 'package:flutter_fb_notes/shared/title_app_bar.dart';
import 'package:flutter_fb_notes/view_model/add_note_view_model.dart';
import 'package:intl/intl.dart';

class AddNewNotes extends StatefulWidget {
  @override
  State<AddNewNotes> createState() => _AddNewNotesState();
}

class _AddNewNotesState extends State<AddNewNotes> {
  AddNoteViewModel _model = AddNoteViewModel();
  @override
  void dispose() {
    _model.title.dispose();
    _model.content.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppStyle.cardsColor[7],
      appBar: AppBar(
        leading: LeadingAppBar(),
        leadingWidth: 100,
        elevation: 0.5,
       // backgroundColor: AppStyle.cardsColor[7],
        iconTheme: const IconThemeData(color: Colors.black),
        title: TitleAppBar(title: "Add a new Notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddTextField(
                controller: _model.title,
                hintText: 'Note title',
                isContent: false, labelText: 'Title',
              ),
              const SizedBox(height: 8.0),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${DateFormat.yMMMd().format(_model.date.toDate())} ${DateFormat.jm().format(_model.date.toDate())}",
                  style:TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: AddTextField(
                  controller: _model.content,
                  hintText: 'Note content',
                  isContent: true, labelText: 'Content',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        //backgroundColor: AppStyle.accentColor,
        onPressed: () {
          _model.addNote(context);
        },
        label: const Text("Save"),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
