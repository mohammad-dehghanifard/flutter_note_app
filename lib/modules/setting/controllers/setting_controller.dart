import 'package:flutter/cupertino.dart';
import 'package:flutter_note_app/core/constants/storage_keys.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
//================================= variables ==================================
  final TextEditingController newUsernameText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();
  SharedPreferences? prefs;
  String? username;
  String? profile;
  bool? hasPassWord;
//================================= methods ====================================
  Future<void> initialPrefs() async {
    prefs = await SharedPreferences.getInstance();
    username = prefs!.getString(StorageKeys.username);
    profile = prefs!.getString(StorageKeys.profile);
    update();
  }
  void changeUserName() async {
    if(newUsernameText.text.isNotEmpty) {
      Get.back(); // close dialog
      await prefs?.setString(StorageKeys.username, newUsernameText.text);
      username =  prefs?.getString(StorageKeys.username);
      update();
    }
  }
  void changeOrSetPassWord() async {
    if(passwordText.text.isNotEmpty) {
      Get.back();
      await prefs?.setString(StorageKeys.password, passwordText.text);
      hasPassWord = true;
      update();
    }
  }
  bool checkPassWord()  {
    var pass =  prefs?.getString(StorageKeys.password);
    if(pass != null){
      return false;
    } else {
      return true;
    }
  }
  Future<void> changeProfile(String imagePath) async {
    await prefs?.setString(StorageKeys.profile, imagePath);
    Get.back();
    profile = prefs?.getString(StorageKeys.profile);
    update();
  }
//================================= life cycle =================================
 @override
  void onInit() {
    initialPrefs();
    hasPassWord = checkPassWord();
    super.onInit();
  }
}
