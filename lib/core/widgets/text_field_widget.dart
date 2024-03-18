import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, this.hint, this.controller, this.validator,this.hasBorder = true,this.maxLine = 1});
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool hasBorder;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: hasBorder? context.theme.colorScheme.primaryContainer : Colors.transparent),
          borderRadius: BorderRadius.circular(12)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: hasBorder? context.theme.colorScheme.primaryContainer : Colors.transparent),
          borderRadius: BorderRadius.circular(12)
        )
      ),
    );
  }
}
