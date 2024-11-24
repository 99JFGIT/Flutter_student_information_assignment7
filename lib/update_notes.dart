import 'package:flutter/material.dart';
import 'package:flutter_assainment7_student_information/services/note_services.dart';

import 'package:get/get.dart';
import 'model/note.dart';

class UpdateNotes extends StatefulWidget {
  final Note? notes;

  const UpdateNotes({super.key, this.notes});

  @override
  State<UpdateNotes> createState() => _UpdateNotesState();
}

class _UpdateNotesState extends State<UpdateNotes> {

  //declare controller
  var student_nameController=TextEditingController();
  var student_idController=TextEditingController();
  var phoneController=TextEditingController();
  var emailController=TextEditingController();
  var locationController=TextEditingController();

  //declare form key variable
  final GlobalKey<FormState> noteFormKey = GlobalKey();

  //declare services
  final NoteService noteService = NoteService();

  //add notes to database
  Future  updateNote() async {
    final newNote = Note(
      id: widget.notes!.id,
      student_name: widget.notes!.student_name,
      student_id: widget.notes!.student_id,
      phone: widget.notes!.phone,
      email: widget.notes!.email,
      location: widget.notes!.location,
    );

    await noteService.updateNote(newNote);

    Get.back();

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    student_nameController.text = widget.notes!.student_name.toString();
    student_idController.text = widget.notes!.student_id.toString();
    phoneController.text=widget.notes!.phone.toString();
    emailController.text=widget.notes!.email.toString();
    locationController.text=widget.notes!.location.toString();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.green
        ),
        backgroundColor: Colors.green.shade100,
        title: Text("Update Student Info",style: TextStyle(
            color: Colors.green
        ),),


      ),
      body: Form(
        key: noteFormKey,
        child:SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(
                controller: student_nameController,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Student Name",
                  hintText: "Your Name",
                  prefixIcon: const Icon(Icons.person,color: Colors.greenAccent,),
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
                  prefixIcon: const Icon(Icons.onetwothree,color: Colors.greenAccent,),
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
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Phone",
                  hintText: "Your Phone No",
                  prefixIcon: const Icon(Icons.phone,color: Colors.greenAccent,),
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
                  hintText: "Your email",
                  prefixIcon: const Icon(Icons.email,color: Colors.greenAccent,),
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
                  prefixIcon: const Icon(Icons.location_on,color: Colors.greenAccent,),
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
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                onPressed: () async {
                  if(noteFormKey.currentState!.validate())
                  {
                    noteFormKey.currentState!.save();



                    updateNote();



                  }

                },
                child:  Text(
                  "Update",
                  style: const TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold),

                ),
              ),

            ],
          ),

        ) ,
      ),
    );
  }
}