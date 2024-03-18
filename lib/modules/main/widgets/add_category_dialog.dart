import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/widgets/button_widget.dart';
import 'package:flutter_note_app/core/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("ایجاد دسته بندی جدید"),
              const SizedBox(height: 12),
              const TextFieldWidget(hint: "نام دسته بندی را وارد کنید"),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonWidget(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      text: "ایجاد",
                      onTap: () {}),
                  ButtonWidget(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      text: "لغو",
                      onTap: () => Get.back()
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
