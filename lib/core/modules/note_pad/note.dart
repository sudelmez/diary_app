import 'package:flutter/material.dart';

class Note {
  int id;
  String title;
  String content;
  DateTime date_created;
  Color note_color;

  Note(this.id, this.title, this.content, this.date_created, this.note_color);
}
