import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/widgets/button_widget.dart';
import 'package:flutter_note_app/core/widgets/text_field_widget.dart';
import 'package:flutter_note_app/modules/auth/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginWithPassWordPage extends StatelessWidget {
  const LoginWithPassWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                  Icon(Icons.lock_open,size: 260,color: context.theme.colorScheme.primary),
                  const SizedBox(height: 8),
                  const SizedBox(height: 32),
                  TextFieldWidget(
                      controller: controller.inputPassWord,
                      inputType: TextInputType.visiblePassword,
                      hint: "رمز عبور خود را وارد کنید"),
                  const SizedBox(height: 32),
                  ButtonWidget(
                      text: "ورود به برنامه",
                      onTap: () => controller.checkPassAndLogin())
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
