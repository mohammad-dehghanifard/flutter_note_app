import 'package:flutter/cupertino.dart';
import 'package:flutter_note_app/core/constants/storage_keys.dart';
import 'package:flutter_note_app/modules/main/pages/main_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
//======================== variables ===========================================
 final TextEditingController inputPassWord = TextEditingController();

//======================== methods =============================================
  Future<void> checkPassAndLogin() async {
    if(inputPassWord.text.isNotEmpty) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final password = prefs.getString(StorageKeys.password);
      if(password == inputPassWord.text){
        Get.to(const MainPage());
      } else {
        print("invalid password...");
      }
    }
  }

}