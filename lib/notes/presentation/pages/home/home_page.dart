import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fb_notes/core/classes/responsice_screen.dart';
import 'package:flutter_fb_notes/core/constant/constes.dart';
import 'package:flutter_fb_notes/core/functions/navigation.dart';
import 'package:flutter_fb_notes/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:flutter_fb_notes/notes/presentation/pages/note/add_notes.dart';
import 'package:flutter_fb_notes/notes/presentation/widgets/home/view_container.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.init(context);
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: () {
          pushPage(
            context,
            AddNewNotes(),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Notes", style: TextStyle(color: Colors.white)),
        elevation: 0,
        backgroundColor: AppStyle.mainColor,
      ),
      body: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          if (state is NotesSuccess) {
            replacePage(context, HomePage());
          }
        },
        builder: (context, state) {
          if (state is NotesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is NotesLoaded) {
            final notes = state.notes;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Your recent Notes",
                      style: GoogleFonts.roboto(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomContainer(notes: notes)
                ],
              ),
            );
          }
          if (state is NotesError) {
            return Center(
              child: Text(
                "There's not Notes",
                style: GoogleFonts.nunito(color: Colors.white),
              ),
            );
          } else {
            return Center(
              child: Text("No Data"),
            ); // Add your default UI here when the state is NotesInitial or NotesEmpty.
          }
        },
      ),
    );
  }
}
