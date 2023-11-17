import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_project/components/Dashboard/Dashboard.dart';
import 'package:login_project/components/PengajuanCuti/PengajuanCuti.dart';
import 'package:login_project/constant.dart';

void main() {
  runApp(
    const MaterialApp(
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
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: kPrimaryColor,
          height: 70,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Iconsax.calendar), label: 'Ajukan Cuti'),
            NavigationDestination(
                icon: Icon(Iconsax.clipboard_text), label: 'Absensi'),
            NavigationDestination(
                icon: Icon(Iconsax.calendar_add), label: 'Ajukan Surat'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
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
    Container(color: Colors.purple),
  ];
}
