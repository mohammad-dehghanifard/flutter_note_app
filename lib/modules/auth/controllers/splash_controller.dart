import 'package:flutter_note_app/core/constants/storage_keys.dart';
import 'package:flutter_note_app/modules/auth/pages/register_page.dart';
import 'package:flutter_note_app/modules/main/pages/main_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {

//==================== Methods =================================================

  Future<bool> isFirstLogin() async{
    final prefs = await SharedPreferences.getInstance();
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
      final bool isFirst = await isFirstLogin();
      Get.off(isFirst ? const RegisterPage() : const MainPage());
    },);
    super.onInit();
  }

}