import 'package:flutter/material.dart';

class ShowDate extends StatelessWidget {
  final String title;
  const ShowDate({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
