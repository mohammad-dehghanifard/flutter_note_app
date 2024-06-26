import 'package:flutter_note_app/core/constants/storage_keys.dart';
import 'package:flutter_note_app/core/database/models/category.dart';
import 'package:flutter_note_app/modules/auth/pages/login_with_password_page.dart';
import 'package:flutter_note_app/modules/auth/pages/register_page.dart';
import 'package:flutter_note_app/modules/main/pages/main_page.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  bool? hasPassWord;
//==================== Methods =================================================

  Future<bool> checkUsernameAndPassWord() async{
    final prefs = await SharedPreferences.getInstance();
    final passWord = prefs.getString(StorageKeys.password);
    // check password
    if(passWord == null){
      hasPassWord = false;
    } else {
      hasPassWord = true;
    }
    //check username
    if(prefs.getString(StorageKeys.username) == null){
      return true;
    } else {
      return false;
    }

  }

 //==================== life cycle =============================================
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 4)).then((value) async {
      final bool isFirst = await checkUsernameAndPassWord();
      if(isFirst){
        final Box<Category> categoryBox = Hive.box<Category>(StorageKeys.hiveCategoryKey);
        final List<Category> defaultCategory = [
          Category(title: "خاطرات"),
          Category(title: "لیست خرید"),
          Category(title: "جزوه های آموزشی"),
          Category(title: "داستان کوتاه"),
        ];
        categoryBox.addAll(defaultCategory);
      }
      Get.offAll(isFirst ? const RegisterPage() : hasPassWord! ? const LoginWithPassWordPage() : const MainPage());
    },);
    super.onInit();
  }

}