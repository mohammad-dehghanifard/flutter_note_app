import 'package:flutter_note_app/core/constants/storage_keys.dart';
import 'package:flutter_note_app/core/database/models/note.dart';
import 'package:flutter_note_app/modules/home/controllers/home_controller.dart';
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

  void removeNote(Note note) async {
    Get.back(); // close bottom sheet
    note.category?.notes.removeWhere((it) => note.title == it.title);
    note.delete();
    noteList.removeWhere((it) => note.title == it.title);
    _updateCategoryList();
    update();
  }

  void _updateCategoryList(){
    final controller = Get.find<HomeController>();
    controller.categoryList.clear();
    controller.fetchCategoryList();
  }

  void updateNoteFavorite(Note note) {
    Get.back();
    note.isFavorite = !note.isFavorite;
    note.save();
  }
//=================================== life cycle ===============================

@override
  void onInit() {
    fetchNotes();
    super.onInit();
  }
}