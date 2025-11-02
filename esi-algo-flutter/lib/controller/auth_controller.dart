import 'dart:convert';

import 'package:esi_algo/controller/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  Future<void> createUser(String username, String password) async {
    Uri url = Uri.parse("http://localhost:8000/users/create");
    Map bodyParams = {
      'username': username,
      'password': password,
    };
    try {
      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*",
          },
          body: json.encode(bodyParams));

      if (response.statusCode == 200) {
        Get.offAllNamed(RouteClass.getProblemSet());
      } else {
        Get.snackbar(
          "Error",
          "Username already exists",
          backgroundColor: const Color(0xffd1495b),
          borderRadius: 15.r,
          margin: EdgeInsets.all(15.r),
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (exception) {
      Get.defaultDialog(
        title: "Error",
        middleText: exception.toString(),
        backgroundColor: const Color(0xffd1495b),
        radius: 15.r,
        content: const Icon(
          Icons.error_outline_rounded,
          color: Colors.white,
        ),
      );
    }
  }

  void logout() {
    GetStorage storage = GetStorage();
    storage.remove("token");
    storage.remove("username");
  }
}

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GetStorage storage = GetStorage();

  bool isObscure = true;

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  Future<void> getToken(String username, String password) async {
    final url = Uri.parse("http://localhost:8000/users/token");

    final body = {
      'username': username,
      'password': password,
    };

    final headers = {
      "Access-Control-Allow-Origin": "*",
    };
    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final accessToken =
            json.decode(response.body.toString())['access_token'];

        storage.write("token", accessToken);
        storage.write("username", username);
      }
    } catch (exception) {
      Get.defaultDialog(
        title: "Error",
        middleText: exception.toString(),
        backgroundColor: const Color(0xffd1495b),
        radius: 15.r,
        content: const Icon(
          Icons.error_outline_rounded,
          color: Colors.white,
        ),
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
