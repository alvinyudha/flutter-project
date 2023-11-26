import 'package:flutter/material.dart';
import 'package:login_project/utilities/constant.dart';

class Profile extends StatelessWidget {
  final Map userData;
  final String username;
  final String nip;
  final String phoneNumber;

  const Profile({
    Key? key,
    required this.userData,
    required this.username,
    required this.nip,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        toolbarHeight: 76,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [kPrimaryColor, kSecondaryColor],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF5FF),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileInfo(label: 'Nama Pengguna', value: username),
                ProfileInfo(label: 'NIP', value: nip),
                ProfileInfo(label: 'Nomor Telepon', value: phoneNumber),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    showChangePasswordDialog(context);
                  },
                  child: ListTile(
                    leading: Icon(Icons.lock_open),
                    title: Text('Ubah Kata Sandi'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text('Versi 1.0'),
                      Text('Copyright © 2023 Polije SIP'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChangePasswordDialog();
      },
    );
  }
}

class ChangePasswordDialog extends StatefulWidget {
  @override
  _ChangePasswordDialogState createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmNewPasswordController;
  bool isOldPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Perbarui Kata Sandi'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Isi formulir berikut untuk perbarui kata sandi:'),
          SizedBox(height: 20),
          buildPasswordTextField(
            controller: oldPasswordController,
            labelText: 'Sandi Lama',
            isVisible: isOldPasswordVisible,
            toggleVisibility: () {
              setState(() {
                isOldPasswordVisible = !isOldPasswordVisible;
              });
            },
          ),
          SizedBox(height: 15),
          buildPasswordTextField(
            controller: newPasswordController,
            labelText: 'Sandi Baru',
            isVisible: isNewPasswordVisible,
            toggleVisibility: () {
              setState(() {
                isNewPasswordVisible = !isNewPasswordVisible;
              });
            },
          ),
          SizedBox(height: 15),
          buildPasswordTextField(
            controller: confirmNewPasswordController,
            labelText: 'Konfirmasi Sandi Baru',
            isVisible: isConfirmPasswordVisible,
            toggleVisibility: () {
              setState(() {
                isConfirmPasswordVisible = !isConfirmPasswordVisible;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Lakukan perbaruan kata sandi di sini
            // ...
            // Tutup dialog
            Navigator.pop(context);
          },
          child: Text('Perbarui'),
        ),
        TextButton(
          onPressed: () {
            // Tutup dialog tanpa melakukan perubahan
            Navigator.pop(context);
          },
          child: Text('Batal'),
        ),
      ],
    );
  }

  Widget buildPasswordTextField({
    required TextEditingController controller,
    required String labelText,
    required bool isVisible,
    required VoidCallback toggleVisibility,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: 'Masukkan $labelText Anda',
        border: outlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: InkWell(
          onTap: toggleVisibility,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfo({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
