import 'package:flutter/material.dart';
import 'package:flutter_note_app/modules/home/pages/home_page.dart';
import 'package:flutter_note_app/modules/main/widgets/bottom_navigation_widget.dart';
import 'package:flutter_note_app/modules/note/pages/all_note_page.dart';
import 'package:flutter_note_app/modules/setting/controllers/setting_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Stack(
            children: [
              const Positioned.fill(
                child: IndexedStack(
                  index: 0,
                  children: [
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
                    onChangePage: (index) {},
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}



