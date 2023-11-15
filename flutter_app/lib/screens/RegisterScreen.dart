import 'package:flutter/material.dart';

import 'package:login_project/components/Register/RegisterForm.dart';
import 'package:login_project/size_config.dart';
// import 'package:date_field/date_field.dart';

class RegisterScreen extends StatelessWidget {
  // static String routeName = "/login";
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: RegisterForm(),
    );
  }
}
