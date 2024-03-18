import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_note_app/modules/main/controllers/navigation_controller.dart';
import 'package:flutter_note_app/modules/main/widgets/add_bottomsheet_widget.dart';
import 'package:get/get.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    super.key, required this.onChangePage,
  });

  final Function(int index) onChangePage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      width: MediaQuery.sizeOf(context).width,
      height: 48,
      decoration: BoxDecoration(
          color: context.theme.colorScheme.primaryContainer.withOpacity(0.30),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
          ),
          border: const Border(top: BorderSide(color: Colors.white))
      ),
      child: GetBuilder<NavigationController>(
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _NavigationItemWidget(
                  onTap: () {onChangePage(0);},
                  selected: controller.selectedIndex == 0,
                  icon: CupertinoIcons.home),

              _NavigationItemWidget(
                  onTap: () {onChangePage(1);},
                  selected: controller.selectedIndex == 1,
                  icon: Icons.event_note),

             // add button
              const _NavigationAddButton(),

             _NavigationItemWidget(
                  onTap: () {onChangePage(2);},
                 selected: controller.selectedIndex == 2,
                  icon: Icons.favorite),
              _NavigationItemWidget(
                  onTap: () {onChangePage(3);},
                  selected: controller.selectedIndex == 3,
                  icon: CupertinoIcons.settings),
            ],
          );
        }
      ),
    );
  }
}

class _NavigationAddButton extends StatelessWidget {
  const _NavigationAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          showModalBottomSheet(context: context, builder: (context) => const AddBottomSheetWidget());
      },
      child: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white30),
          shape: BoxShape.circle,
          color: context.theme.colorScheme.secondary
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}


class _NavigationItemWidget extends StatelessWidget {
  const _NavigationItemWidget({
    super.key, required this.icon, required this.onTap,this.selected = false
  });
  final IconData icon;
  final bool selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          margin: const EdgeInsets.all(3),
              duration: const Duration(milliseconds: 500),
              width: selected? 40 : 0,
              height: selected? 40 : 0,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.secondary,
              shape: BoxShape.circle
            ),
           ),
        IconButton(onPressed: onTap, icon:  Icon(icon))
      ],
    );
  }
}
