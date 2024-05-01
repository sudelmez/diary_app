import 'package:diary_app/core/base/modules/provider/note_list_notifier.dart';
import 'package:diary_app/core/base/state/base_state.dart';
import 'package:diary_app/core/modules/note_pad/note.dart';
import 'package:diary_app/product/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/base/modules/navigation/navigation_service.dart';

abstract class HomeViewmodel extends BaseState<HomeView> {
  late List<Note> noteList;
  @override
  void initState() {
    noteList = Provider.of<NoteListNotifier>(context, listen: false).notes;
    super.initState();
  }

  showDeleteAllConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Tüm Notları Sil"),
          content: const Text("Tüm notları silmek istediğinize emin misiniz? Bu işlem geri alınamaz."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                NavigationService.instance.navigatePop();
              },
              child: const Text("İptal"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  Provider.of<NoteListNotifier>(context, listen: false).deleteAll();
                  NavigationService.instance.navigatePop();
                });
              },
              child: const Text("Evet, Sil"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
