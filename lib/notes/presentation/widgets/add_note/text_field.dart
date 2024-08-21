import 'package:flutter/material.dart';

class AddTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool isContent;
  final String labelText;
  const AddTextField(
      {super.key,
      this.controller,
      required this.hintText,
      this.isContent = true,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: isContent ? TextInputType.multiline : null,
        maxLines: isContent ? null : null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
          hintText: hintText,
          labelText: labelText,
          border: UnderlineInputBorder(),
        ),
        style: TextStyle(color: Colors.white)
        //isContent ? AppStyle.mainContent : AppStyle.mainTitle,
        );
  }
}
