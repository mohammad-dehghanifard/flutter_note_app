import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/widgets/button_widget.dart';
import 'package:flutter_note_app/core/widgets/text_field_widget.dart';
import 'package:flutter_note_app/modules/auth/controllers/register_controller.dart';
import 'package:flutter_note_app/modules/main/pages/main_page.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: GetBuilder<RegisterController>(
              init: RegisterController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // logo
                    Image.asset("assets/images/logo.png",scale: 4,color: context.theme.colorScheme.primary),
                    const SizedBox(height: 24),
                    const Text("دوست من خیلی خوش اومدی، اسمتو بهم بگو تا کارمون رو شروع کینم."),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      controller: controller.textController,
                      hint: "نام کاربریت رو وارد کن..",
                    ),
                    const SizedBox(height: 24),
                    ButtonWidget(text: "بزن بریم!",onTap:  controller.register)
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
