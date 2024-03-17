import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_note_app/core/database/config/hive_config.dart';
import 'package:flutter_note_app/core/themes/theme_helper.dart';
import 'package:flutter_note_app/modules/auth/pages/splash_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF202326)
    )
  );
  await HiveConfig.setConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Note app',
      theme: ThemeHelper.dark,
      locale: const Locale("fa"),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}




