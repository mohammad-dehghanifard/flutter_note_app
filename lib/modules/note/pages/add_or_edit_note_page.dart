import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class AddOrEditNotePage extends StatelessWidget {
  const AddOrEditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: context.theme.colorScheme.secondary,
        child: const Icon(CupertinoIcons.checkmark_alt,color: Colors.white,size: 42),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.topLeft,
                    child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: BackButton())),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                // title
                const TextFieldWidget(hint: "عنوان نوشته را وارد کنید",hasBorder: false),
                // content
                const TextFieldWidget(hint: "متن نوشته را وارد کنید...",hasBorder: false,maxLine: 20),
                // select category
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: context.theme.colorScheme.primaryContainer
                    ),
                    child: const Row(
                      children: [
                        Text("انتخاب دسته بندی"),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down_sharp)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
