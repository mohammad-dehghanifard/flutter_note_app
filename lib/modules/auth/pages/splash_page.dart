import 'package:flutter/material.dart';
import 'package:flutter_note_app/modules/auth/controllers/splash_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Note App"),
                const SizedBox(height: 24),
                SpinKitPulse(
                  color: context.theme.colorScheme.primary,
                  size: 30.0,
                )
              ],
            ));
      }
    );
  }
}
