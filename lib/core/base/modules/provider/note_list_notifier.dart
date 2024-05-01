import 'package:diary_app/core/modules/note_pad/note.dart';
import 'package:flutter/material.dart';

class NoteListNotifier extends ChangeNotifier {
  List<Note> notes = [];

  addList(Note value) {
    notes.add(value);
    notifyListeners();
  }

  deleteItem(int id) {
    notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }

  editItem(Note value) {
    final index = notes.indexWhere((note) => note.id == value.id);
    notes[index] = value;
    notifyListeners();
  }

  deleteAll() {
    notes.clear();
    notifyListeners();
  }
}
