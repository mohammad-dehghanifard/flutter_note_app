import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteCategoryWidget extends StatelessWidget {
  const NoteCategoryWidget({
    super.key, required this.title, required this.notes,
  });

  final String title;
  final int notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: context.theme.colorScheme.primaryContainer.withOpacity(0.50),
          borderRadius: BorderRadius.circular(16)
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Text("$notes نوشته"),
        ],
      ),
    );
  }
}