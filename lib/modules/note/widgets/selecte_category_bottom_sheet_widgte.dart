import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/database/models/category.dart';
import 'package:flutter_note_app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class SelectCategoryBottomSheetWidget extends StatelessWidget {
  const SelectCategoryBottomSheetWidget({super.key, required this.oncChange});
  final Function(Category newCategory) oncChange;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return ListView.builder(
        itemCount: controller.categoryList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => oncChange(controller.categoryList[index]),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              width: MediaQuery.sizeOf(context).width,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: context.theme.colorScheme.primaryContainer),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text(controller.categoryList[index].title!)),
            ),
          );
        },
    );
  }
}
