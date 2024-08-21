import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fb_notes/core/classes/responsice_screen.dart';
import 'package:flutter_fb_notes/core/constant/constes.dart';
import 'package:flutter_fb_notes/core/functions/navigation.dart';
import 'package:flutter_fb_notes/notes/data/remote/models/model_note.dart';
import 'package:flutter_fb_notes/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:flutter_fb_notes/notes/presentation/pages/note/Edit_note.dart';
import 'package:flutter_fb_notes/notes/presentation/pages/note/read_note.dart';
import 'package:intl/intl.dart';

class CustomContainer extends StatelessWidget {
  final List<Notes> notes;
  final void Function()? readNote;
  const CustomContainer({super.key, required this.notes, this.readNote});

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.init(context);
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio:
              //ResponsiveScreen.screen_height /1050

              0.8,
        ),
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              pushPage(
                context,
                ReadNote(notes: notes[index]),
              );
            },
            child: Container(
              height: ResponsiveScreen.screen_height,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppStyle.cardsColor[notes[index].colorId!],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          notes[index].noteTitle,
                          maxLines: 1,
                          style: AppStyle.mainTitle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<NotesCubit>(context)
                              .deleteNote("${notes[index].id}");
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "${DateFormat.yMMMd().format(notes[index].date.toDate())} ${DateFormat.jm().format(notes[index].date.toDate())}",
                          style: AppStyle.dataTile,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          pushPage(
                            context,
                            NoteEdit(note: notes[index]),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    notes[index].noteContent,
                    maxLines: 3,
                    style: AppStyle.mainContent,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
