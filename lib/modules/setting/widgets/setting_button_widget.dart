import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({
    super.key, required this.onTap, required this.title, required this.icon,
  });

  final Function() onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: context.theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12)
      ),
      child:  Row(
        children: [
          Icon(icon,size: 16),
          const SizedBox(width: 8),
          Text(title),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_left),
        ],
      ),
    );
  }
}