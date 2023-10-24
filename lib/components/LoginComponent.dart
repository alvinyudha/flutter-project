import 'package:flutter/material.dart';
import 'package:login_project/size_config.dart';
import 'package:simple_shadow/simple_shadow.dart';

class LoginComponent extends StatefulWidget {
  @override
  _LoginComponent createState() => _LoginComponent();
}

class _LoginComponent extends State<LoginComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              SimpleShadow(
                  child: Image.asset(
                "assets/images/jamur.png",
                height: 150,
                width: 202,
              ))
            ],
          ),
        ),
      ),
    ));
  }
}
