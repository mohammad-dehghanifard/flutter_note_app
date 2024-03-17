import 'package:flutter/material.dart';
import 'package:flutter_note_app/modules/setting/pages/set_password_page.dart';
import 'package:flutter_note_app/modules/setting/widgets/chnage_username_dialog_widget.dart';
import 'package:flutter_note_app/modules/setting/widgets/setting_button_widget.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
   const SettingPage({super.key});



  @override
  Widget build(BuildContext context) {

    final List<SettingButtonWidget> buttons = [
      SettingButtonWidget(onTap: () {
        showDialog(context: context, builder: (context) => const ChangeUserNameDialogWidget());
      }, title: "تغییر نام کاربری", icon: Icons.edit),
      SettingButtonWidget(onTap: () => Get.to(const SetPassWordPage()), title: "تنظیم رمز عبور", icon: Icons.lock),
      SettingButtonWidget(onTap: () {}, title: "مشاهده نوشته های مورد علاقه", icon: Icons.favorite),
      SettingButtonWidget(onTap: () {}, title: "درباره ما", icon: Icons.code),
    ];

    return  Column(
      children: [
        const Row(
          children: [
            CircleAvatar(),
            SizedBox(width: 8),
            Text("محمد دهقانی فرد")
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
}

