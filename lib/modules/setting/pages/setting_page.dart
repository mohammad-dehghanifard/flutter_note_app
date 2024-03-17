import 'package:flutter/material.dart';
import 'package:flutter_note_app/modules/setting/widgets/setting_button_widget.dart';

class SettingPage extends StatelessWidget {
   SettingPage({super.key});

  final List<SettingButtonWidget> buttons = [
    SettingButtonWidget(onTap: () {}, title: "تغییر نام کاربری", icon: Icons.edit),
    SettingButtonWidget(onTap: () {}, title: "تنظیم رمز عبور", icon: Icons.lock),
    SettingButtonWidget(onTap: () {}, title: "مشاهده نوشته های مورد علاقه", icon: Icons.favorite),
    SettingButtonWidget(onTap: () {}, title: "درباره ما", icon: Icons.code),
  ];

  @override
  Widget build(BuildContext context) {
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

