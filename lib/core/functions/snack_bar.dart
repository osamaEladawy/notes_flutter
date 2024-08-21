import 'package:flutter/material.dart';

void snackBar(context, content) {
  ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
      content:content,
      backgroundColor: Colors.white,
      
    ),
  );
}
