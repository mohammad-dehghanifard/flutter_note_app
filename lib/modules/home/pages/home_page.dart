import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/database/models/category.dart';
import 'package:flutter_note_app/modules/home/controllers/home_controller.dart';
import 'package:flutter_note_app/modules/home/widgets/note_category_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("دسته بندی ها"),
        const SizedBox(height: 12),
        GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return Expanded(
                child: GridView.builder(
                  itemCount: controller.categoryList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent: MediaQuery.sizeOf(context).height / 9
                  ),
                  itemBuilder: (context, index) {
                    final Category category = controller.categoryList[index];
                    return NoteCategoryWidget(title: category.title ?? "",notes: category.notes.length);
                  },
                )
            );
          }
        )
      ],
    );
  }
}


