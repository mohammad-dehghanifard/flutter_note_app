import 'package:flutter/material.dart';
import 'package:flutter_note_app/modules/home/pages/home_page.dart';
import 'package:flutter_note_app/modules/main/controllers/navigation_controller.dart';
import 'package:flutter_note_app/modules/main/widgets/bottom_navigation_widget.dart';
import 'package:flutter_note_app/modules/note/pages/all_note_page.dart';
import 'package:flutter_note_app/modules/setting/controllers/setting_page.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: GetBuilder<NavigationController>(
            init: NavigationController(),
            builder: (controller) {
              return Stack(
                children: [
                   Positioned.fill(
                    child: IndexedStack(
                      index: controller.selectedIndex,
                      children: const [
                        HomePage(),
                        AllNotePage(),
                        SettingPage()
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                      right: 10,
                      left: 10,
                      child: BottomNavigationWidget(
                        onChangePage: (index) => controller.changePage(index),
                      )
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}



