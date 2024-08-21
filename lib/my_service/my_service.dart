import 'package:firebase_core/firebase_core.dart';

class MyService {
  Future<MyService> init() async {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDq-1Oao21VKErfHBeJ637cPnXM7w-Br0w",
            appId: "1:758096584189:android:d7f3224f1413a0cf77cd94",
            messagingSenderId: "758096584189",
            projectId: "flutter-firebase-notes-a98cd",
            storageBucket: "flutter-firebase-notes-a98cd.appspot.com",));
    return this;
  }

  Future initializeApp()async{
    return await MyService().init();
  }
}
