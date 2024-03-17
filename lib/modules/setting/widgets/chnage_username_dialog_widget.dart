import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/widgets/button_widget.dart';
import 'package:flutter_note_app/core/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class ChangeUserNameDialogWidget extends StatelessWidget {
  const ChangeUserNameDialogWidget({super.key});

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
              const Text("تغییر نام کاربری"),
              const SizedBox(height: 12),
              const TextFieldWidget(hint: "نام کاربری جدید را وراد کنید..."),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonWidget(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    text: "ثبت",
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
