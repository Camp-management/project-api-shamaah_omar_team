import 'package:flutter/material.dart';
import 'features/folder/screen/folder_screen.dart';
import 'features/folder/screen/folder_screen_copy.dart';
import 'features/folder/screen/folder_test.dart';

void main() {
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
    return MaterialApp(debugShowCheckedModeBanner: false,
    home:FolderScreenCopy()// FolderTest(),//FolderScreen()
    );
  }
}
