import 'package:diary_app/core/base/modules/navigation/navigation_paths.dart';
import 'package:diary_app/core/base/modules/navigation/navigation_service.dart';
import 'package:diary_app/core/base/modules/provider/note_list_notifier.dart';
import 'package:diary_app/core/base/state/base_state.dart';
import 'package:diary_app/core/modules/note_pad/note.dart';
import 'package:diary_app/product/write_note/write_note.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:math';

abstract class WriteNoteClass extends BaseState<WriteNote> {
  late String note;
  late String title;
  late Color selectedColor;
  late DateTime date;
  Note? editedNote;
  void saveNote() {
    if (widget.note == null) {
      if (title != "" && note != "") {
        Provider.of<NoteListNotifier>(context, listen: false).addList(Note(_generateRandomId(), title, note, DateTime.now(), selectedColor));
        FocusScope.of(context).unfocus();
        NavigationService.instance.navigateToPageClear(path: NavigationPaths.home);
      }
    } else {
      editedNote = Note(widget.note!.id, title, note, DateTime.now(), selectedColor);
      Provider.of<NoteListNotifier>(context, listen: false).editItem(editedNote!);
      FocusScope.of(context).unfocus();
      NavigationService.instance.navigateToPageClear(path: NavigationPaths.home);
    }
  }

  int _generateRandomId() {
    final random = Random();
    return random.nextInt(1000000);
  }

  void showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildColorOption(Colors.red),
                _buildColorOption(Colors.blue),
                _buildColorOption(Colors.green),
                _buildColorOption(Colors.yellow),
                _buildColorOption(Colors.purple),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildColorOption(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 40,
        width: 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: color),
      ),
    );
  }

  String formatDate(DateTime date) {
    final dateFormat = DateFormat('dd MMMM yyyy, HH:mm');
    return dateFormat.format(date);
  }

  @override
  void initState() {
    title = widget.note?.title ?? "";
    note = widget.note?.content ?? "";
    selectedColor = widget.note?.note_color ?? Colors.red;
    date = widget.note?.date_created ?? DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
