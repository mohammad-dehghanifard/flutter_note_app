import 'package:flutter_note_app/core/constants/storage_keys.dart';
import 'package:flutter_note_app/core/database/models/note.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class NoteController extends GetxController {
//=================================== variables ================================

  final Box<Note> noteBox = Hive.box(StorageKeys.hiveNoteKey);
  final List<Note> noteList = [];

//=================================== Methods ==================================
  void fetchNotes() {
    final list = noteBox.values.toList();
    noteList.addAll(list);
    update();
  }

//=================================== life cycle ===============================

@override
  void onInit() {
    fetchNotes();
    super.onInit();
  }
}