import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:login_project/routes.dart';
import 'screens/LoginScreen.dart';

void main() async {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Project',
      theme: ThemeData(),
      home: LoginScreen(),
    );
  }
}
