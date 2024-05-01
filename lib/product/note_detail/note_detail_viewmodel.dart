import 'package:diary_app/core/base/state/base_state.dart';
import 'package:diary_app/product/note_detail/note_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../core/base/modules/navigation/navigation_paths.dart';
import '../../core/base/modules/navigation/navigation_service.dart';
import '../../core/base/modules/provider/note_list_notifier.dart';
import '../../core/modules/note_pad/note.dart';

abstract class NoteDetailViewModel extends BaseState<NoteDetail> {
  late Note noteDetail;
  @override
  void initState() {
    noteDetail = widget.note;
    super.initState();
  }

  String formatDate(DateTime date) {
    final dateFormat = DateFormat('dd MMMM yyyy, HH:mm');
    return dateFormat.format(date);
  }

  void deleteNote() {
    Provider.of<NoteListNotifier>(context, listen: false).deleteItem(widget.note.id);
    FocusScope.of(context).unfocus();
    NavigationService.instance.navigateToPageClear(path: NavigationPaths.home);
  }

  showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Bu Notu Sil"),
          content: const Text("Bu notu silmek istediğinize emin misiniz? Bu işlem geri alınamaz."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                NavigationService.instance.navigatePop();
              },
              child: const Text("İptal"),
            ),
            TextButton(
              onPressed: () {
                deleteNote();
              },
              child: const Text("Evet, Sil"),
            ),
          ],
        );
      },
    );
  }

  void editNote() {
    NavigationService.instance.navigateToPage(path: NavigationPaths.writeNote, arguments: {"note": widget.note});
  }

  @override
  void dispose() {
    super.dispose();
  }
}
