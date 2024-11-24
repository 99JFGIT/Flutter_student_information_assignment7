class Note {
  String? id;
  String student_name;
  String student_id;
  String phone;
  String email;
  String location;

  Note({
    this.id,
    required this.student_name,
    required this.student_id,
    required this.phone,
    required this.email,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_name': student_name,
      'student_id': student_id,
      'phone': phone,
      'email': email,
      'location': location,
    };
  }

  static Note fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      student_name: json['student_name'],
      student_id: json['student_id'],
      phone: json['phone'],
      email: json['email'],
      location: json['location'],
    );
  }
}