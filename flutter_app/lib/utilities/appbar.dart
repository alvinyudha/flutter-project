import 'package:flutter/material.dart';
import 'package:login_project/utilities/constant.dart';

class JAppbar extends StatelessWidget implements PreferredSizeWidget {
  const JAppbar(
      {super.key,
      this.tittle,
      this.showbackarrow = false,
      this.actions,
      this.leadingOnPressed,
      this.leadingicon});
  final Widget? tittle;
  final bool showbackarrow;
  final IconData? leadingicon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [kPrimaryColor, kSecondaryColor],
          )),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
