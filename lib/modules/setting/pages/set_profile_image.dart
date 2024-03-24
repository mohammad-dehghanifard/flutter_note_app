import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/widgets/button_widget.dart';
import 'package:flutter_note_app/modules/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';

class SetProfileImage extends StatelessWidget {
  const SetProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final imageList = [
      "assets/images/profile1.png",
      "assets/images/profile2.png",
      "assets/images/profile3.png",
      "assets/images/profile4.png",
      "assets/images/profile5.png",
      "assets/images/profile6.png",
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Align(
                alignment: Alignment.topLeft,
                child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: BackButton())),
            Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisCount: 2
                    ),
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                         children: [
                           Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: Image.asset(imageList[index]).image
                                )
                              ),
                            ),
                           const SizedBox(height: 14),
                           ButtonWidget(
                             width: MediaQuery.sizeOf(context).width * 0.3,
                             text: "انتخاب تصویر",
                             onTap: () {
                               Get.find<SettingController>().changeProfile(imageList[index]);
                             },)
                         ],
                      );
                    },
                ))

          ],
        ),
      )
    );
  }
}
