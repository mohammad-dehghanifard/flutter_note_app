import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteActionBottomSheet extends StatelessWidget {
  const NoteActionBottomSheet({super.key, required this.liked});
  final bool liked;
  @override
  Widget build(BuildContext context) {
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
            onTap: () {},
          ),
          _NoteActionWidget(
            title: liked ? "حذف از علاقه مندی ها" :"افزودن به علاقه مندی ها",
            icon: liked ? CupertinoIcons.heart : CupertinoIcons.heart_fill,
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
