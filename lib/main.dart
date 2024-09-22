import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newapps/LoginPage.dart';
import 'package:newapps/firebase_options.dart';

void main() async {
// Flutter apps are protuti...........=========================== ??
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
// Firebase are connection ............========================== ??
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
      ),
      home: Loginpage(),
    );
  }
}
