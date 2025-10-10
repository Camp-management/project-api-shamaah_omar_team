import 'package:flutter/material.dart';
import 'package:smart_notes/features/auth/screen/login_screen.dart';
import 'package:smart_notes/features/auth/screen/signup_screen.dart';
import 'features/folder/screen/folder_screen.dart';
import 'features/folder/screen/folder_screen_copy.dart';
import 'features/folder/screen/folder_test.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // FolderTest(),//FolderScreen()
    );
  }
}
