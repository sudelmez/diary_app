import 'package:diary_app/core/base/modules/navigation/navigation_paths.dart';
import 'package:diary_app/core/base/modules/navigation/navigation_service.dart';
import 'package:diary_app/core/modules/note_pad/note.dart';
import 'package:flutter/material.dart';

Widget NoteCard({required IconData icon, required Size size, required Note note}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: InkWell(
      onTap: () {
        NavigationService.instance.navigateToPage(path: NavigationPaths.noteDetail, arguments: {"note": note});
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            width: size.width * 6 / 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: note.note_color,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(child: Text(note.content, overflow: TextOverflow.fade)),
          ),
          const SizedBox(height: 10),
          Text(note.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Divider(indent: 20, endIndent: 20),
        ],
      ),
    ),
  );
}
