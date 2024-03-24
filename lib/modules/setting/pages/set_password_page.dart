import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/widgets/button_widget.dart';
import 'package:flutter_note_app/core/widgets/text_field_widget.dart';
import 'package:flutter_note_app/modules/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';

class SetPassWordPage extends StatelessWidget {
  const SetPassWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GetBuilder<SettingController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: BackButton())),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                  Icon(Icons.lock_open,size: 260,color: context.theme.colorScheme.primary),
                  const SizedBox(height: 8),
                  const Text(
                      "در صورتی که قصد دارید برای ورود به برنامه از رمز عبور استفاده کنید از این بخش استفاده کنید.",
                        textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  TextFieldWidget(
                      controller: controller.passwordText,
                      hint: "رمز عبور خود را وارد کنید"),
                  const SizedBox(height: 32),
                  ButtonWidget(
                      text: controller.hasPassWord!? "تغییر رمز عبور" : "ذخیره رمز عبور",
                      onTap: () => controller.changeOrSetPassWord())
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
