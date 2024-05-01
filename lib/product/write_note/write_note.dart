import 'package:diary_app/core/base/view/base_view.dart';
import 'package:diary_app/core/component/appbar/appbar.dart';
import 'package:diary_app/product/write_note/write_note_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../core/modules/note_pad/note.dart';

class WriteNote extends StatefulWidget {
  final Note? note;
  const WriteNote({super.key, this.note});

  @override
  State<WriteNote> createState() => _WriteNoteState();
}

class _WriteNoteState extends WriteNoteClass {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      scaffoldBackgroundColor: themeData.scaffoldBackgroundColor,
      appBar: CustomAppbar(isBackbutton: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(padding: const EdgeInsets.all(5), decoration: BoxDecoration(border: Border.all(width: 0.3), borderRadius: BorderRadius.circular(20)), child: Text(formatDate(date))),
                InkWell(
                  onTap: () {
                    showColorPicker(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(border: Border.all(width: 0.3), borderRadius: BorderRadius.circular(20), color: selectedColor),
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  color: themeData.cardColor,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(fontSize: title.isEmpty ? 20 : 20, color: Colors.deepPurple, fontWeight: FontWeight.bold),
                    child: Text(title.isEmpty ? 'Başlık ekleyin' : title),
                  ),
                ),
              ),
            ),
          ),
          const Divider(indent: 15, endIndent: 15),
          Expanded(
            flex: 8,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  color: themeData.cardColor,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      fontSize: note.isEmpty ? 20 : 20,
                      color: Colors.black,
                    ),
                    child: Text(
                      note.isEmpty ? 'Not ekleyin' : note,
                      style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Başlık',
              ),
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Not',
              ),
              onChanged: (value) {
                setState(() {
                  note = value;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: saveNote,
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
  }
}
