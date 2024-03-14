import 'package:flutter_note_app/modules/auth/pages/register_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
 //==================== variables ==============================================

 //==================== Methods ================================================

 //==================== life cycle =============================================
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Get.off(const RegisterPage());
    },);
    super.onInit();
  }

}