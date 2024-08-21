import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fb_notes/core/functions/back.dart';

class LeadingAppBar extends StatelessWidget {
  
  const LeadingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        back(context);
      },
      icon: const Icon(
        CupertinoIcons.chevron_down,
        color: Colors.white,
      ),
      label: const Text(
        "Exit",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
