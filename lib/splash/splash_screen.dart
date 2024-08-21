import 'package:flutter/material.dart';
import 'package:flutter_fb_notes/core/classes/responsice_screen.dart';
import 'package:flutter_fb_notes/core/functions/navigation.dart';
import 'package:flutter_fb_notes/notes/presentation/pages/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      replacePage(context, HomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Container(
        height: ResponsiveScreen.screen_height,
        width: ResponsiveScreen.screen_width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/img1.png"),
            Text(
              "Welcome...",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
