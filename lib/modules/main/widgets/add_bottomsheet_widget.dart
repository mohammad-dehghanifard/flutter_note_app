import 'package:flutter/material.dart';
import 'package:flutter_note_app/modules/home/widgets/add_category_dialog.dart';
import 'package:flutter_note_app/modules/note/pages/add_or_edit_note_page.dart';
import 'package:get/get.dart';

class AddBottomSheetWidget extends StatelessWidget {
  const AddBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
            _AddItemButton(
            onTap:() {
              Get.back();
              showDialog(context: context, builder: (context) => const AddCategoryDialog());
            },
            icon: Icons.category,
            title: "دسته بندی",
          ),

          _AddItemButton(
            onTap:() {
              Get.back();
               Get.to(const AddOrEditNotePage());
            },
            icon: Icons.note_alt_rounded,
            title: "یادداشت",
          )
        ],
      ),
    );
  }
}

class _AddItemButton extends StatelessWidget {
  const _AddItemButton({
    super.key, required this.title, required this.icon, required this.onTap,
  });

  final String title;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: context.theme.colorScheme.primaryContainer),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 8),
            Text(title,style: const TextStyle(fontSize: 12),)
          ],
        ),
      ),
    );
  }
}
