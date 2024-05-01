import 'package:diary_app/core/base/view/base_view.dart';
import 'package:diary_app/core/component/appbar/appbar.dart';
import 'package:flutter/material.dart';

import '../../core/modules/note_pad/note.dart';
import 'note_detail_viewmodel.dart';

class NoteDetail extends StatefulWidget {
  final Note note;
  const NoteDetail({super.key, required this.note});

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends NoteDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: CustomAppbar(title: noteDetail.title, isBackbutton: true),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(formatDate(noteDetail.date_created)),
                const SizedBox(height: 15),
                Container(
                    width: width - 20,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(border: Border.all(width: 0.5), borderRadius: BorderRadius.circular(20), color: noteDetail.note_color),
                    child: Text(noteDetail.content, overflow: TextOverflow.fade)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDeleteConfirmation(context);
                          },
                          icon: const Icon(Icons.delete_outline_outlined)),
                      IconButton(
                          onPressed: () {
                            editNote();
                          },
                          icon: const Icon(Icons.edit)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
