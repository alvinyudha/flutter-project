import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Map userData = {};
  // final _formkey = GlobalKey<FormState>();

  String? _selectedGender;
  String? _selectedAgama;
  DateTime _selectedDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Tambahkan _formKey ke Form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Masukkan Name'),
                    MinLengthValidator(3,
                        errorText: 'Minimum 3 charecter filled name'),
                  ]),
                  decoration: InputDecoration(
                      hintText: 'Name',
                      labelText: 'Name',
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
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Masukkan Username'),
                    MinLengthValidator(3,
                        errorText: 'Minimum 3 charecter filled username'),
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
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Masukkan Alamat Email'),
                    EmailValidator(errorText: 'Please correct email filled'),
                  ]),
                  decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
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
                  obscureText: true,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Masukkan Password'),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DateTimeFormField(
                  decoration: InputDecoration(
                    hintText: 'Tanggal Lahir',
                    labelText: 'Tanggal Lahir',
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: Color.fromARGB(255, 132, 0, 255),
                    ),
                    errorStyle: TextStyle(fontSize: 15.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    ),
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
                  decoration: InputDecoration(
                    hintText: 'Jenis Kelamin',
                    labelText: 'Jenis Kelamin',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 132, 0, 255),
                    ),
                    errorStyle: TextStyle(fontSize: 15.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
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
                  decoration: InputDecoration(
                    hintText: 'Agama',
                    labelText: 'Agama',
                    prefixIcon: Icon(
                      Icons.privacy_tip,
                      color: Color.fromARGB(255, 132, 0, 255),
                    ),
                    errorStyle: TextStyle(fontSize: 15.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Masukkan alamat'),
                    // Tambahkan validasi sesuai kebutuhan
                  ]),
                  decoration: InputDecoration(
                    hintText: 'Alamat',
                    labelText: 'Alamat',
                    prefixIcon: Icon(
                      Icons.location_on, // Menggunakan ikon lokasi untuk alamat
                      color: Color.fromARGB(255, 132, 0, 255),
                    ),
                    errorStyle: TextStyle(fontSize: 15.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Jika form valid, implementasi logika registrasi
                          // ...
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        primary: Color.fromARGB(255, 132, 0, 255),
                      ),
                      child: Text(
                        'Daftar',
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
                  Navigator.pushNamed(context, '/login');
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

Widget buildTextField(TextEditingController controller, String labelText,
    {TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    bool readOnly = false}) {
  return Container(
    width: double.infinity,
    child: TextField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
    ),
  );
}
