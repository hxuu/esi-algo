import 'package:esi_algo/view/screens/about.dart';
import 'package:esi_algo/view/screens/auth/sign_in.dart';
import 'package:esi_algo/view/screens/auth/sign_up.dart';
import 'package:esi_algo/view/home.dart';
import 'package:esi_algo/view/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class NavBar extends StatelessWidget {
  final Icon firstLeading;
  final String username;
  final Icon secondLeading;
  final Image? image;
  final Widget firstTitle;
  final Widget secondTitle;
  const NavBar({
    super.key,
    required this.firstLeading,
    required this.secondLeading,
    required this.firstTitle,
    required this.secondTitle,
    this.image,
    this.username = "Account Name",
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: WebColor.background,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: WebColor.primary,
            ),
            accountName: Text(username),
            accountEmail: const Text("Problems Solved: ?"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: WebColor.background,
              child: image ??
                  const Text("A",
                      style: TextStyle(fontSize: 40, color: Colors.black)),
            ),
          ),
          ListTile(
            leading: firstLeading,
            title: firstTitle,
            onTap: () => Get.off(() => LoginPage()),
          ),
          ListTile(
            leading: secondLeading,
            title: secondTitle,
            onTap: () => Get.off(() => const SignUpPage()),
          ),
        ],
      ),
    );
  }
}

class NavBarLogged extends StatelessWidget {
  final Icon firstLeading;
  final String username;
  final Icon secondLeading;
  final Image? image;
  final Widget firstTitle;
  final Widget secondTitle;
  const NavBarLogged({
    super.key,
    required this.firstLeading,
    required this.secondLeading,
    required this.firstTitle,
    required this.secondTitle,
    this.image,
    this.username = "Account Name",
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Drawer(
      backgroundColor: WebColor.background,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            accountName: Text(username),
            accountEmail: const Text("Problems Solved: ?"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: WebColor.background,
              child: image ??
                  const Text("A",
                      style: TextStyle(fontSize: 40, color: Colors.black)),
            ),
          ),
          ListTile(
            leading: firstLeading,
            title: firstTitle,
            onTap: () {
              controller.logout();
              Get.offAll(() => const HomePage());
            },
          ),
          ListTile(
            leading: secondLeading,
            title: secondTitle,
            onTap: () => Get.to(() => const AboutUsPage()),
          ),
        ],
      ),
    );
  }
}
