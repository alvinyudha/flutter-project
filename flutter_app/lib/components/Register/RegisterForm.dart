import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:login_project/api/auth_service.dart';
import 'package:login_project/api/servicesURL.dart';
import 'package:login_project/utilities/button_custom_color.dart';
import 'package:login_project/utilities/custom_surfix_icon.dart';
import 'package:login_project/utilities/constant.dart';
import 'package:login_project/screens/LoginScreen.dart';
import 'package:login_project/utilities/size_config.dart';
import 'package:http/http.dart' as http;

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  FocusNode focusNode = FocusNode();
  Map userData = {};
  // final _formkey = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _name = '';
  String _username = '';

  registerPressed() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
    if (emailValid) {
      http.Response response =
          await AuthServices.register(_name, _email, _password, _username);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.to(const LoginScreen());
      } else {
        // ignore: use_build_context_synchronously
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'harap masukkan semua field yang ada');
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Registrasi',
                      style: TextStyle(fontSize: 35),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    _name = value;
                  },
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Masukkan Name'),
                    MinLengthValidator(3,
                        errorText: 'Minimum 3 charecter filled name'),
                  ]),
                  keyboardType: TextInputType.text,
                  style: mTitleStyle,
                  decoration: InputDecoration(
                    hintText: 'Masukkan nama',
                    labelText: 'Name',
                    labelStyle: TextStyle(
                        color: focusNode.hasFocus
                            ? mSubtitleColor
                            : kPrimaryColor),
                    suffixIcon: const CustomSurffixIcon(
                        svgIcon: "assets/icons/User.svg"),
                    errorStyle: const TextStyle(fontSize: 15.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: outlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    _username = value;
                  },
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Masukkan Username'),
                    MinLengthValidator(3,
                        errorText: 'Minimum 3 charecter filled username'),
                  ]),
                  keyboardType: TextInputType.text,
                  style: mTitleStyle,
                  decoration: InputDecoration(
                    hintText: 'Masukkan username Anda',
                    labelText: 'Username',
                    labelStyle: TextStyle(
                        color: focusNode.hasFocus
                            ? mSubtitleColor
                            : kPrimaryColor),
                    suffixIcon: const CustomSurffixIcon(
                        svgIcon: "assets/icons/User.svg"),
                    errorStyle: const TextStyle(fontSize: 15.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: outlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    _email = value;
                  },
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Masukkan Alamat Email'),
                    EmailValidator(errorText: 'Please correct email filled'),
                  ]),
                  keyboardType: TextInputType.text,
                  style: mTitleStyle,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Alamat Email Anda',
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: focusNode.hasFocus
                            ? mSubtitleColor
                            : kPrimaryColor),
                    suffixIcon: const CustomSurffixIcon(
                        svgIcon: "assets/icons/Mail.svg"),
                    errorStyle: const TextStyle(fontSize: 15.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: outlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    _password = value;
                  },
                  obscureText: true,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Masukkan Password'),
                    MinLengthValidator(3,
                        errorText: 'Minimum 3 charecter filled password'),
                  ]),
                  keyboardType: TextInputType.text,
                  style: mTitleStyle,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Password Anda',
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: focusNode.hasFocus
                            ? mSubtitleColor
                            : kPrimaryColor),
                    suffixIcon: const CustomSurffixIcon(
                        svgIcon: "assets/icons/Lock.svg"),
                    errorStyle: const TextStyle(fontSize: 15.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: outlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DefaultButtonCustomeColor(
                    color: kPrimaryColor,
                    text: "DAFTAR",
                    press: () => registerPressed(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Get.to(const LoginScreen());
                },
                child: const Text(
                  'Login kembali',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: kPrimaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
