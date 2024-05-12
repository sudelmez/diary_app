import 'package:diary_app/core/modules/note_pad/note.dart';

class UserModel {
  final String email;
  final String? phone;
  String? docRef;
  String? userId;
  List<Note>? notes;

  UserModel({required this.email, this.phone, this.docRef, this.userId, this.notes});

  factory UserModel.fromJson(Map<String, dynamic> json, {String? id, String? docRef}) {
    return UserModel(
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      userId: id,
      docRef: docRef,
      notes: json['notes'] != null ? List<Note>.from(json['notes']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'userId': userId,
      'notes': notes,
    };
  }
}
