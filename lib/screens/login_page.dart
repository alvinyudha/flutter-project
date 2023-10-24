import 'package:flutter/material.dart';
// import 'package:date_field/date_field.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_project/components/LoginComponent.dart';
import 'package:login_project/size_config.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _usernameController,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Tidak dapat dikosongkan'),
                    MinLengthValidator(3,
                        errorText: 'Minimum 3 charecter filled name'),
                  ]),
                  decoration: InputDecoration(
                      hintText: 'Username',
                      labelText: 'Username',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 132, 0, 255),
                      ),
                      errorStyle: TextStyle(fontSize: 15.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius:
                              BorderRadius.all(Radius.circular(9.0)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Masukkan password'),
                    EmailValidator(errorText: 'Please correct password filled'),
                  ]),
                  decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.key,
                        color: Color.fromARGB(255, 132, 0, 255),
                      ),
                      errorStyle: TextStyle(fontSize: 15.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius:
                              BorderRadius.all(Radius.circular(9.0)))),
                ),
              ),
              SizedBox(height: 32.0),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        primary: Color.fromARGB(255, 132, 0, 255),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Form is valid, implement login logic
                          String username = _usernameController.text;
                          String password = _passwordController.text;

                          // Add your login logic here
                          // For example, you can validate the credentials and navigate to the next screen.

                          // For now, print the values to the console
                          print('Username: $username, Password: $password');
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  // Navigasi ke halaman registrasi
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Belum punya akun? Daftar sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
