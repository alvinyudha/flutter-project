import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_project/components/custom_surfix_icon.dart';
import 'package:login_project/constant.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remember = false;
  TextEditingController txtUsername = TextEditingController(),
      txtPassword = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        key: _formKey,
        children: [],
      ),
    );
  }
}
