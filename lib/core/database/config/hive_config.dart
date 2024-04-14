import 'package:flutter_note_app/core/constants/storage_keys.dart';
import 'package:flutter_note_app/core/database/models/category.dart';
import 'package:flutter_note_app/core/database/models/note.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConfig {
 static Future<void> setConfig() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteAdapter());
    Hive.registerAdapter(CategoryAdapter());
    await Hive.openBox<Category>(StorageKeys.hiveCategoryKey);
    await Hive.openBox<Note>(StorageKeys.hiveNoteKey);
  }
}