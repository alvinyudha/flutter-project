import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_project/components/Dashboard/Dashboard.dart';
import 'package:login_project/components/PengajuanCuti/PengajuanCuti.dart';
import 'package:login_project/components/Personalization/profile.dart';
import 'package:login_project/utilities/constant.dart';

void main() {
  runApp(
    const GetMaterialApp(
      home: NavigationMenu(),
    ),
  );
}

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
            labelTextStyle: MaterialStatePropertyAll(
                TextStyle(fontWeight: FontWeight.bold))),
        child: Obx(
          () => NavigationBar(
            backgroundColor: Colors.white,
            height: 70,
            elevation: 0,
            animationDuration: const Duration(seconds: 1),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Iconsax.home,
                    color: kPrimaryColor,
                  ),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(
                    Iconsax.calendar,
                    color: kPrimaryColor,
                  ),
                  label: 'Ajukan Cuti'),
              NavigationDestination(
                  icon: Icon(
                    Iconsax.clipboard_text,
                    color: kPrimaryColor,
                  ),
                  label: 'Absensi'),
              NavigationDestination(
                  icon: Icon(
                    Iconsax.calendar_add,
                    color: kPrimaryColor,
                  ),
                  label: 'Ajukan Surat'),
              NavigationDestination(
                  icon: Icon(
                    Iconsax.user,
                    color: kPrimaryColor,
                  ),
                  label: 'Profile'),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const DashboardPage(),
    const PengajuanCutiPage(karyawanData: {}),
    Container(color: Colors.blue),
    Container(color: Colors.teal),
    const Profile(),
  ];
}
