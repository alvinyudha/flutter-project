import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:login_project/api/auth_service.dart';
import 'package:login_project/api/servicesURL.dart';
import 'package:login_project/components/button_custom_color.dart';
import 'package:login_project/components/custom_surfix_icon.dart';
import 'package:login_project/constant.dart';
import 'package:login_project/screens/NavigationMenu.dart';
import 'package:login_project/screens/RegisterScreen.dart';
import 'package:login_project/size_config.dart';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();
  bool? remember = false;
  TextEditingController txtEmail = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = FocusNode();
  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.to(const NavigationMenu());
      } else {
        // ignore: use_build_context_synchronously
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'harap masukkan email dan password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        key: _formKey,
        children: [
          buildEmail(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPassword(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Row(
            children: [
              Checkbox(
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  }),
              const Text("Tetap Masuk"),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Lupa Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "MASUK",
            press: () => loginPressed(),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Get.to(const RegisterScreen());
            },
            child: const Text(
              "Belum punya akun? Daftar Sekarang",
              style: TextStyle(
                  decoration: TextDecoration.underline, color: kPrimaryColor),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      onChanged: (value) {
        _email = value;
      },
      controller: txtEmail,
      validator: MultiValidator([
        RequiredValidator(errorText: 'Tidak dapat dikosongkan'),
        MinLengthValidator(3, errorText: 'Minimum 3 charecter filled name'),
      ]),
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Masukkan email anda',
          border: outlineInputBorder(),
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          errorStyle: const TextStyle(fontSize: 15.0),
          suffixIcon:
              const CustomSurffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      onChanged: (value) {
        _password = value;
      },
      validator: MultiValidator([
        RequiredValidator(errorText: 'Masukkan password'),
        MinLengthValidator(3, errorText: 'Minimum 3 charecter filled password'),
      ]),
      controller: txtPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Masukkan password anda',
        border: outlineInputBorder(),
        labelStyle: TextStyle(
            color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorStyle: const TextStyle(fontSize: 15.0),
        suffixIcon: const CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}
