import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_note_app/core/themes/theme_helper.dart';
import 'package:flutter_note_app/modules/auth/pages/splash_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF202326)
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Note app',
      theme: ThemeHelper.dark,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}




