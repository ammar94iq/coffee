import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';

/*
void main() {
  runApp(const MyApp());
}
*/
void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(375,
          812), // Set the base design size (adjust based on your Figma/sketch file)
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CLASSIC ICE',
      home: MenuPage(),
    );
  }
}
