import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/database/models/note.dart';
import 'package:flutter_note_app/core/widgets/text_field_widget.dart';
import 'package:flutter_note_app/modules/note/controllers/add_or_edit_note_controller.dart';
import 'package:flutter_note_app/modules/note/widgets/selecte_category_bottom_sheet_widgte.dart';
import 'package:get/get.dart';

class AddOrEditNotePage extends StatelessWidget {
  const AddOrEditNotePage({super.key,  this.note});
  final Note? note;

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
            child: GetBuilder<AddOrEditNoteController>(
              init: AddOrEditNoteController(note: note),
              builder: (controller) {
                return Column(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: BackButton())),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                    // title
                     TextFieldWidget(
                       controller: controller.noteTitle,
                        hint: "عنوان نوشته را وارد کنید",
                        hasBorder: false),
                    // content
                     TextFieldWidget(
                         controller: controller.noteContent,
                         hint: "متن نوشته را وارد کنید...",
                         hasBorder: false,maxLine: 20),
                    // select category
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => SelectCategoryBottomSheetWidget(
                              oncChange: (newCategory) {
                                Get.back();
                                controller.setCategory(newCategory);
                              },
                            ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: context.theme.colorScheme.primaryContainer
                        ),
                        child:  Row(
                          children: [
                            Text(controller.selectedCategory == null ? "انتخاب دسته بندی" : controller.selectedCategory!.title! ),
                            const Spacer(),
                            const Icon(Icons.keyboard_arrow_down_sharp)
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
