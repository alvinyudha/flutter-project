import 'package:flutter/material.dart';
import 'package:login_project/routes.dart';
import 'screens/LoginScreen.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Project',
    theme: ThemeData(),
    initialRoute: LoginScreen.routeName,
    routes: routes,
  ));
}
