import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/Views/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      home: SplashScreen(),
    );
  }
}
