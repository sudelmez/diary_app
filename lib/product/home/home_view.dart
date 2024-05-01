import 'package:diary_app/core/base/view/base_view.dart';
import 'package:diary_app/core/component/appbar/appbar.dart';
import 'package:diary_app/product/component/note_card.dart';
import 'package:diary_app/product/home/home_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewmodel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      scaffoldBackgroundColor: themeData.scaffoldBackgroundColor,
      appBar: CustomAppbar(
        onPressDel: () {
          showDeleteAllConfirmation(context);
        },
        isDelete: noteList.isNotEmpty ? true : false,
        isNote: true,
        title: "My Notes",
      ),
      body: Column(
        children: [
          SizedBox(
              height: height * 6 / 7,
              width: width,
              child: ListView.builder(itemCount: noteList.length, itemBuilder: ((context, index) => NoteCard(note: noteList[index], icon: Icons.abc, size: size))))
        ],
      ),
    );
  }
}
