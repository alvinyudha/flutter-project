import 'package:flutter/material.dart';
import 'package:login_project/components/Login/LoginComponent.dart';
import 'package:login_project/size_config.dart';
// import 'package:date_field/date_field.dart';

class LoginScreen extends StatelessWidget {
  // static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: LoginComponent(),
    );
  }
}
