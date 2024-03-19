import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/database/models/note.dart';
import 'package:flutter_note_app/modules/note/widgets/note_action_bottom_sheet.dart';
import 'package:get/get.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key, required this.note,
  });
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      decoration: BoxDecoration(
          color: context.theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
          // title and action icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(note.title!),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(context: context, builder: (context) => NoteActionBottomSheet(note: note));
                  },
                  icon: const Icon(Icons.more_vert)),
            ],
          ),
          // content
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child:  Text(
              note.content!,
              maxLines: 3,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
