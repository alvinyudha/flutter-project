import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_project/components/button_custom_color.dart';
import 'package:login_project/components/custom_surfix_icon.dart';
import 'package:login_project/constant.dart';
import 'package:login_project/size_config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  // String? username;
  // String? password;
  bool? remember = false;
  TextEditingController txtUsername = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        key: _formKey,
        children: [
          buildUsername(),
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
              Text("Tetap Masuk"),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Lupa Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          DefaultButtonCustomeColor(
              color: kPrimaryColor,
              text: "MASUK",
              press: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  // Jika form valid, implementasi logika registrasi
                  // ...
                }
              }),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              "Belum punya akun? Daftar Sekarang",
              style: TextStyle(
                  decoration: TextDecoration.underline, color: kPrimaryColor),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildUsername() {
    return TextFormField(
      controller: txtUsername,
      validator: MultiValidator([
        RequiredValidator(errorText: 'Tidak dapat dikosongkan'),
        MinLengthValidator(3, errorText: 'Minimum 3 charecter filled name'),
      ]),
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Username',
          hintText: 'Masukkan username anda',
          border: outlineInputBorder(),
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          errorStyle: TextStyle(fontSize: 15.0),
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
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
        errorStyle: TextStyle(fontSize: 15.0),
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}
