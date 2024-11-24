import 'package:flutter/material.dart';
import 'package:flutter_assainment7_student_information/services/note_services.dart';

import 'package:get/get.dart';
import 'model/note.dart';


class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {

  //declare controller
  var student_nameController = TextEditingController();
  var student_idController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var locationController = TextEditingController();

  //form key variable
  final GlobalKey<FormState> noteFormKey = GlobalKey();

  //service variable
  final NoteService noteService = NoteService();

  //add notes to database
  Future addNotes() async
  {
    final newNote = Note(
      student_name: student_nameController.text,
      student_id: student_idController.text,
      phone: phoneController.text,
      email: emailController.text,
      location: locationController.text,
    );

    //if data insert successfully, its return row number which is greater that 1 always
    await noteService.addNote(newNote);

    Get.back();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.green
        ),
        backgroundColor: Colors.green.shade100,
        title: Text("Add Student Information", style: TextStyle(
            color: Colors.green
        ),),


      ),
      body: Form(
        key: noteFormKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [

              TextFormField(
                controller: student_nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Student Name",
                  hintText: "Your Name",
                  prefixIcon: const Icon(
                    Icons.person, color: Colors.greenAccent,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Name";
                  }

                  return null;
                },
              ),

              SizedBox(height: 10,),
              TextFormField(
                controller: student_idController,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Student Id",
                  hintText: "Your Id",
                  prefixIcon: const Icon(
                    Icons.onetwothree, color: Colors.greenAccent,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Id";
                  }

                  return null;
                },
              ),

              SizedBox(height: 10,),
              TextFormField(
                controller: phoneController,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Phone",
                  hintText: "Your Phone No",
                  prefixIcon: const Icon(
                    Icons.phone, color: Colors.greenAccent,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Phone No";
                  }

                  return null;
                },
              ),

              SizedBox(height: 10,),
              TextFormField(
                controller: emailController,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Your Email",
                  prefixIcon: const Icon(
                    Icons.email, color: Colors.greenAccent,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Email";
                  }

                  return null;
                },
              ),

              SizedBox(height: 10,),
              TextFormField(
                controller: locationController,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Location",
                  hintText: "Your Location",
                  prefixIcon: const Icon(
                    Icons.location_on, color: Colors.greenAccent,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Location";
                  }

                  return null;
                },
              ),

              SizedBox(height: 50,),

              ElevatedButton(
                style: ElevatedButton.styleFrom(

                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.green.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                onPressed: () async {
                  if (noteFormKey.currentState!.validate()) {
                    noteFormKey.currentState!.save();


                    addNotes();
                  }
                },
                child: Text(
                  "Save",
                  style: const TextStyle(color: Colors.green,
                      fontWeight: FontWeight.bold),

                ),
              ),

            ],
          ),

        ),
      ),
    );
  }
}