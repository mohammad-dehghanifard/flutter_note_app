import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_note_app/core/constants/storage_keys.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
//============================ Variables =======================================
  final categoryBox = Hive.box<Category>(StorageKeys.hiveCategoryKey);
  final TextEditingController newCategoryTextController = TextEditingController();
  final List<Category> categoryList = [];


//============================ Methods =========================================

  void fetchCategoryList() {
    final list = categoryBox.values.toList();
    categoryList.addAll(list);
    update();
  }

//============================ LifeCycle =======================================
@override
  void onInit() {
    fetchCategoryList();
    super.onInit();
  }


}