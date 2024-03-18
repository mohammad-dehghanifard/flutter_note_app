import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/database/models/note.dart';
import 'package:flutter_note_app/modules/note/controllers/note_controller.dart';
import 'package:flutter_note_app/modules/note/widgets/note_widget.dart';
import 'package:get/get.dart';

class AllNotePage extends StatelessWidget {
  const AllNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteController>(
      init: NoteController(),
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.noteList.length,
          itemBuilder: (context, index) {
            final Note note = controller.noteList[index];
          return  NoteWidget(note: note);
        },);
      }
    );
  }
}

