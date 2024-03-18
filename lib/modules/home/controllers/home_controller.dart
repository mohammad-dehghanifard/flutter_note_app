import 'package:flutter/cupertino.dart';
import 'package:flutter_note_app/core/constants/storage_keys.dart';
import 'package:flutter_note_app/core/database/models/category.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
//============================ Variables =======================================
  final Box<Category> categoryBox = Hive.box<Category>(StorageKeys.hiveCategoryKey);
  final TextEditingController newCategoryTextController = TextEditingController();
  final List<Category> categoryList = [];


//============================ Methods =========================================

  void fetchCategoryList() {
    final list = categoryBox.values.toList();
    categoryList.addAll(list);
    update();
  }

  Future<void> addCategoryToHive() async {
    final Category newCategory = Category(title: newCategoryTextController.text);
    await categoryBox.add(newCategory);
    categoryList.add(newCategory);
    newCategoryTextController.clear();
    update();
  }

//============================ LifeCycle =======================================
@override
  void onInit() {
    fetchCategoryList();
    super.onInit();
  }


}