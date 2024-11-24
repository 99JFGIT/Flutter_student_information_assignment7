
import 'package:flutter/material.dart';
import 'package:flutter_assainment7_student_information/services/note_services.dart';
import 'package:flutter_assainment7_student_information/update_notes.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


//import 'package:url_launcher/url_launcher.dart';

import 'add_notes.dart';
import 'model/note.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final NoteService noteService = NoteService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green),
        backgroundColor: Colors.green.shade100,
        title: const Text("View All Students", style: TextStyle(color: Colors.green)),
      ),
      body: StreamBuilder<List<Note>>(
        stream: noteService.getNotes(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final notes = snapshot.data!;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.green, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onTap: () {
                    Get.to(UpdateNotes(notes: note));
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Student name aligned to the left
                      Text(
                        note.student_name!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Delete button aligned to the right
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          noteService.deleteNote(note.id!);
                        } ,
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      // Phone number aligned to the left
                      Expanded(child: Text(note.phone!)),
                      // Call button aligned to the right of the phone number
                      IconButton(
                        icon: const Icon(Icons.call, color: Colors.green, size: 30),
                        onPressed: () {
                          //_makeCall(note.phone!); // Launch phone dialer
                        },
                      ),
                    ],
                  ),
                  leading: const Icon(
                    Icons.onetwothree,
                    color: Colors.greenAccent,
                    size: 40,
                  ),
                ),
              );
            },
          );

        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(const AddNotes());
        },
      ),
    );
  }
}
