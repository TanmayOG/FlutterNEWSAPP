import 'package:flutter/material.dart';

import 'package:newmo/home/splash_screen.dart';

import 'package:newmo/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Bgmi.primary),
      home: const SplashScreen(),
    );
  }
}
