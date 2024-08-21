import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
  final bool isContent;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.isContent = true,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: isContent ? TextInputType.multiline : null,
        maxLines: isContent ? 100 : null,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
          border: UnderlineInputBorder(),
        ),
        style: isContent
            ? TextStyle(color: Colors.white)
            : TextStyle(color: Colors.white),
        //isContent ? AppStyle.mainContent : AppStyle.mainTitle,
        onChanged: onChanged);
  }
}

class CustomTextField2 extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
    final TextEditingController? controller;

  final bool isContent;
  const CustomTextField2({
    super.key,
    required this.hintText,
    this.onChanged,
    this.isContent = true,
              this.controller,

  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: 100,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(color: Colors.white),
        onChanged: onChanged);
  }
}
