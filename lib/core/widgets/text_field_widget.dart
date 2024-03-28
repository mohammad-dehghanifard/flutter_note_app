import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key, this.hint, this.controller, this.validator,this.hasBorder = true,this.maxLine = 1,this.inputType = TextInputType.text});
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool hasBorder;
  final int maxLine;
  final TextInputType inputType;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  bool observe = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      maxLines: widget.maxLine,
      obscureText: widget.inputType == TextInputType.visiblePassword? observe : false,
      keyboardType: widget.inputType,
      decoration:  InputDecoration(
        hintText: widget.hint,
        suffixIcon: widget.inputType == TextInputType.visiblePassword? IconButton(
          onPressed: () {
            setState(() {
              observe = !observe;
            });
          },
          icon: Icon(observe? CupertinoIcons.eye : CupertinoIcons.eye_slash),
        ) : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.hasBorder? context.theme.colorScheme.primaryContainer : Colors.transparent),
          borderRadius: BorderRadius.circular(12)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.hasBorder? context.theme.colorScheme.primaryContainer : Colors.transparent),
          borderRadius: BorderRadius.circular(12)
        )
      ),
    );
  }
}
