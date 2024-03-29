import 'package:flutter/material.dart';
import 'package:flutter_note_app/modules/setting/controllers/setting_controller.dart';
import 'package:flutter_note_app/modules/setting/pages/about_us_page.dart';
import 'package:flutter_note_app/modules/setting/pages/set_password_page.dart';
import 'package:flutter_note_app/modules/setting/pages/set_profile_image.dart';
import 'package:flutter_note_app/modules/setting/widgets/chnage_username_dialog_widget.dart';
import 'package:flutter_note_app/modules/setting/widgets/setting_button_widget.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
   const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {

    return  GetBuilder<SettingController>(
      init: SettingController(),
      builder: (controller) {

        final List<SettingButtonWidget> buttons = [
          SettingButtonWidget(onTap: () {
            showDialog(context: context, builder: (context) => const ChangeUserNameDialogWidget());
          }, title: "تغییر نام کاربری", icon: Icons.edit),
          SettingButtonWidget(onTap: () => Get.to(const SetPassWordPage()), title: controller.hasPassWord! ? "تغییر رمز عبور": "تنظیم رمز عبور", icon: Icons.lock),
          SettingButtonWidget(onTap: () => Get.to(const AboutUsPage()), title: "درباره ما", icon: Icons.code),
          SettingButtonWidget(onTap: () => Get.to(const SetProfileImage()), title: "انتخاب تصویر پروفایل", icon: Icons.person),
        ];

        return Column(
          children: [
             Row(
              children: [
                 CircleAvatar(child: controller.profile != null? Image.asset(controller.profile!) : null),
                const SizedBox(width: 8),
                Text(controller.username ?? "کاربر مهمان")
              ],
            ),
            const SizedBox(height: 24),
            // settings option list
            Expanded(
              child: ListView.builder(
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  final settingButton = buttons[index];
                  return SettingButtonWidget(
                    onTap: settingButton.onTap,
                    title: settingButton.title,
                    icon: settingButton.icon,
                  );
                },
              ),
            )
          ],
        );
      }
    );
  }
}

