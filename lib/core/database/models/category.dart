import 'package:hive/hive.dart';
import 'note.dart';

part 'category.g.dart';

@HiveType(typeId: 1)
class Category {
  @HiveField(0)
  String? title;
  @HiveField(1)
  final List<Note> notes = [];
}