import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.width = double.infinity,
    this.height = 45
  });
  final String text;
  final Function() onTap;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [context.theme.colorScheme.primary,context.theme.colorScheme.secondary],
            begin: Alignment.topRight,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(child: Text(text,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
