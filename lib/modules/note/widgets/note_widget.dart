import 'package:flutter/material.dart';
import 'package:flutter_note_app/modules/note/widgets/note_action_bottom_sheet.dart';
import 'package:get/get.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key, required this.title, required this.content,
  });
  final String title;
  final String content;

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
              Text(title),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(context: context, builder: (context) => const NoteActionBottomSheet());
                  },
                  icon: const Icon(Icons.more_vert)),
            ],
          ),
          // content
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child:  Text(
              content,
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
