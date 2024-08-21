import 'package:flutter/material.dart';

void pushPage(context, page) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => page),
  );
}

void replacePage(context, page) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => page),
  );
}

