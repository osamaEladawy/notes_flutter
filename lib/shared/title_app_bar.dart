import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  final String title;
  const TitleAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
//  const Text(
//           'read your notes',
//           style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.pinkAccent),
//         ),