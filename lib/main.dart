import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fb_notes/core/constant/constes.dart';
import 'package:flutter_fb_notes/main_injection_container.dart' as j;
import 'package:flutter_fb_notes/my_service/my_service.dart';
import 'package:flutter_fb_notes/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:flutter_fb_notes/splash/splash_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyService().initializeApp();
  await j.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => j.sl<NotesCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(centerTitle: true,backgroundColor: AppStyle.mainColor),
            scaffoldBackgroundColor: AppStyle.mainColor,
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
