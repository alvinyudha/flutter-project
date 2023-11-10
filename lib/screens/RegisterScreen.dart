import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:login_project/components/button_custom_color.dart';
import 'package:login_project/components/custom_surfix_icon.dart';
import 'package:login_project/constant.dart';
import 'package:login_project/screens/LoginScreen.dart';
import 'package:login_project/size_config.dart';

class RegisterScreen extends StatefulWidget {
  // static String routeName = "/register";
  const RegisterScreen({super.key});
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FocusNode focusNode = FocusNode();
  Map userData = {};
  // final _formkey = GlobalKey<FormState>();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedGender;
  String? _selectedAgama;
  DateTime _selectedDate = DateTime.now();
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // Format tanggal langsung di sini dan set ke controller
        _tanggalLahirController.text =
            '${picked.day}-${picked.month}-${picked.year}';
      });
    }
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Tambahkan _formKey ke Form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Padding(
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
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
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
                    suffixIcon:
                        CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
                    errorStyle: TextStyle(fontSize: 15.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: outlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
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
                    suffixIcon:
                        CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
                    errorStyle: TextStyle(fontSize: 15.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: outlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
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
                    suffixIcon:
                        CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                    errorStyle: TextStyle(fontSize: 15.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: outlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
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
                    suffixIcon:
                        CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                    errorStyle: TextStyle(fontSize: 15.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: outlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DateTimeFormField(
                  dateTextStyle: mTitleStyle,
                  decoration: InputDecoration(
                    hintText: 'Tanggal Lahir',
                    hintStyle: mTitleStyle,
                    labelText: 'Tanggal Lahir',
                    labelStyle: TextStyle(
                        color: focusNode.hasFocus
                            ? mSubtitleColor
                            : kPrimaryColor),
                    suffixIcon:
                        CustomSurffixIcon(svgIcon: "assets/icons/order.svg"),
                    errorStyle: TextStyle(fontSize: 15.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: outlineInputBorder(),
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  onDateSelected: (DateTime selectedDate) {
                    setState(() {
                      _selectedDate = selectedDate;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedGender,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                  items: <String>['Laki-laki', 'Perempuan']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih jenis kelamin';
                    }
                    return null;
                  },
                  style: mTitleStyle,
                  decoration: InputDecoration(
                    hintText: 'Pilih jenis kelamin',
                    hintStyle: mTitleStyle,
                    labelText: 'Jenis Kelamin',
                    labelStyle: TextStyle(
                        color: focusNode.hasFocus
                            ? mSubtitleColor
                            : kPrimaryColor),
                    errorStyle: TextStyle(fontSize: 15.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: outlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedAgama,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedAgama = newValue;
                    });
                  },
                  items: <String>[
                    'Islam',
                    'Hindu',
                    'Budha',
                    'Kristen',
                    'Katolik'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih Agama';
                    }
                    return null;
                  },
                  style: mTitleStyle,
                  decoration: InputDecoration(
                      hintText: 'Pilih agamamu',
                      hintStyle: mTitleStyle,
                      labelText: 'Agama',
                      labelStyle: TextStyle(
                          color: focusNode.hasFocus
                              ? mSubtitleColor
                              : kPrimaryColor),
                      errorStyle: TextStyle(fontSize: 15.0),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: outlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: mTitleStyle,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Masukkan alamat'),
                    // Tambahkan validasi sesuai kebutuhan
                  ]),
                  decoration: InputDecoration(
                      hintText: 'Alamat',
                      labelText: 'Alamat',
                      labelStyle: TextStyle(
                          color: focusNode.hasFocus
                              ? mSubtitleColor
                              : kPrimaryColor),
                      errorStyle: TextStyle(fontSize: 15.0),
                      suffixIcon: CustomSurffixIcon(
                          svgIcon: "assets/icons/Location point.svg"),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: outlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: DefaultButtonCustomeColor(
                        color: kPrimaryColor,
                        text: "DAFTAR",
                        press: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Jika form valid, implementasi logika registrasi
                            // ...
                          }
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Get.to(LoginScreen());
                },
                child: Text(
                  'Login kembali',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
