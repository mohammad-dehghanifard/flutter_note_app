import 'package:hive_flutter/hive_flutter.dart';

class HiveConfig {
 static Future<void> setConfig() async {
    await Hive.initFlutter();
  }
}