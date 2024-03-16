import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    super.key, required this.onChangePage,
  });

  final Function(int index) onChangePage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 48,
      decoration: BoxDecoration(
          color: context.theme.colorScheme.primaryContainer.withOpacity(0.30),
          borderRadius: BorderRadius.circular(100)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavigationItemWidget(
              onTap: () {onChangePage(0);},
              selected: false,
              icon: CupertinoIcons.home),
         _NavigationItemWidget(
              onTap: () {onChangePage(1);},
             selected: true,
              icon: Icons.event_note),
          _NavigationItemWidget(
              onTap: () {onChangePage(2);},
              selected: false,
              icon: CupertinoIcons.settings),
        ],
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
          margin: const EdgeInsets.symmetric(vertical: 4),
              duration: const Duration(milliseconds: 500),
              width: selected? 45 : 0,
              height: selected? 45 : 0,
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
