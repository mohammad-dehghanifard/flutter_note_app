import 'package:flutter/material.dart';
import 'package:flutter_note_app/modules/home/pages/home_page.dart';
import 'package:flutter_note_app/modules/main/controllers/navigation_controller.dart';
import 'package:flutter_note_app/modules/main/widgets/bottom_navigation_widget.dart';
import 'package:flutter_note_app/modules/note/pages/all_note_page.dart';
import 'package:flutter_note_app/modules/setting/pages/setting_page.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationWidget(
            onChangePage: (index) => controller.changePage(index),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Positioned.fill(
                child: IndexedStack(
                  index: controller.selectedIndex,
                  children:  const [
                    HomePage(),
                    AllNotePage(),
                    SettingPage()
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}



