import 'package:flutter_note_app/core/constants/storage_keys.dart';
import 'package:flutter_note_app/core/database/models/category.dart';
import 'package:flutter_note_app/core/database/models/note.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConfig {
 static Future<void> setConfig() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteAdapter());
    Hive.registerAdapter(CategoryAdapter());
    Hive.openBox<Category>(StorageKeys.hiveCategoryKey);
    Hive.openBox<Note>(StorageKeys.hiveNoteKey);
  }
}