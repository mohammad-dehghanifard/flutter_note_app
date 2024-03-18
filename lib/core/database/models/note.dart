import 'package:flutter_note_app/core/database/models/category.dart';
import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject{
  Note({
    this.title,
    this.content,
    this.category,
  });
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? content;
  @HiveField(2)
  bool isFavorite = false;
  @HiveField(3)
  Category? category;
}
