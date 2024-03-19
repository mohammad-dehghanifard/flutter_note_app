import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/constants/storage_keys.dart';
import 'package:flutter_note_app/core/database/models/category.dart';
import 'package:flutter_note_app/core/database/models/note.dart';
import 'package:flutter_note_app/modules/home/controllers/home_controller.dart';
import 'package:flutter_note_app/modules/note/controllers/note_controller.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddOrEditNoteController extends GetxController {
  final Note? note;
  AddOrEditNoteController({this.note});
//============================ Variables =======================================
  final noteBox = Hive.box<Note>(StorageKeys.hiveNoteKey);
  final TextEditingController noteTitle = TextEditingController();
  final TextEditingController noteContent = TextEditingController();
  Category? selectedCategory;

//============================ Methods =========================================

  void setCategory(Category newCategory) {
    selectedCategory = newCategory;
    update();
  }

  Future<void> addOrEditNote() async {
    if(selectedCategory != null) {
      final newNote = Note(title: noteTitle.text,content: noteContent.text,category: selectedCategory);
      if(note != null) {
        note?.title = noteTitle.text;
        note?.content = noteContent.text;
        note?.category = selectedCategory;
        note?.save();
      } else {
        await noteBox.add(newNote);
        selectedCategory!.notes.add(newNote);
      }
      _updateNoteList();
      _updateCategoryList();
    }
  }

  void _updateNoteList() {
    final controller = Get.find<NoteController>();
    controller.noteList.clear();
    controller.fetchNotes();
  }

  void _updateCategoryList(){
    final controller = Get.find<HomeController>();
    controller.categoryList.clear();
    controller.fetchCategoryList();
  }

//============================ LifeCycle =======================================
  @override
  void onInit() {
    if(note != null) {
      selectedCategory = note?.category;
      update();
    }
    super.onInit();
  }
}