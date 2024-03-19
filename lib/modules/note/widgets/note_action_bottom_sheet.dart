import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/database/models/note.dart';
import 'package:flutter_note_app/modules/note/controllers/note_controller.dart';
import 'package:get/get.dart';

class NoteActionBottomSheet extends StatelessWidget {
  const NoteActionBottomSheet({super.key, required this.note});
  final Note note;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NoteController>();
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _NoteActionWidget(
            title: "مشاهده نوشته",
            icon: Icons.remove_red_eye,
            onTap: () {},
          ),
          _NoteActionWidget(
            title: "حذف نوشته",
            icon: Icons.delete_forever,
            onTap: () {
              controller.removeNote(note);
            },
          ),
          _NoteActionWidget(
            title: note.isFavorite ? "حذف از علاقه مندی ها" :"افزودن به علاقه مندی ها",
            icon: note.isFavorite ? CupertinoIcons.heart : CupertinoIcons.heart_fill,
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class _NoteActionWidget extends StatelessWidget {
  const _NoteActionWidget({
    super.key, required this.title, required this.icon, required this.onTap,
  });
  final String title;
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading:  Icon(icon),
      title:  Text(title),
    );
  }
}
