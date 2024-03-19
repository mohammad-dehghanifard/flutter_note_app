import 'package:flutter/cupertino.dart';
import 'package:flutter_note_app/core/constants/storage_keys.dart';
import 'package:flutter_note_app/modules/main/pages/main_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
//==================== variables ==============================================
  final TextEditingController textController = TextEditingController();

//==================== Methods ================================================
  Future<void> register() async {
    final prefs = await SharedPreferences.getInstance();
    if(textController.text.isNotEmpty) {
      prefs.setString(StorageKeys.username, textController.text);
      Get.to(const MainPage());
    }
  }
}