import 'package:flutter/material.dart';
import 'package:testflutterproject/Screens/PageConnexion.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAUPvnWziPcvBwckk2FhV8scMw8hCdomv4",
      appId: "1:1010286911936:android:8e65756003e60b51cd6825",
      projectId: "flutter-project-e5726",
      messagingSenderId: "",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: PageConnexion(),
    );
  }
}






