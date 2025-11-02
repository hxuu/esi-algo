import 'dart:convert';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/delphi.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/exo.dart';

class LiveController extends GetxController {
  CodeController? codeController;

  // hard coded for now
  String? startCode;

  @override
  void onInit() {
    super.onInit();

    final source = startCode ?? '// Write your code here';

    codeController = CodeController(
      text: source,
      language: delphi,
    );
  }

  @override
  void dispose() {
    codeController?.dispose();
    super.dispose();
  }

  List<Exo> exos = [];
  int exoIndex = 0;
  GetStorage storage = GetStorage();

  String? input;
  String? output;

  String? code;

  Future<void> setStdOut(stdIn) async {
    Uri uri = Uri.parse('http://localhost:8000/code/compare');
    String token = storage.read('token');

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Bearer $token",
    };

    final finalCode = stdIn + hiddenCode;

    Map bodyParams = {
      "code": finalCode,
      "input_": input,
      "output": output,
    };

    try {
      var response =
          await http.post(uri, headers: headers, body: json.encode(bodyParams));

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        Get.defaultDialog(
            title: result['status'],
            titleStyle: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.workSans().fontFamily,
              fontSize: 18.sp,
            ),
            middleText: result['message'],
            middleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
            backgroundColor: result['status'] == 'success'
                ? const Color(0xff52b788)
                : const Color(0xffc9184a),
            radius: 15.r,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.input_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Input: ${result['stdin']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    const Icon(
                      Icons.output_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Output: ${result['stdout']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ));
      }
    } catch (exception) {
      print(exception.toString());
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

  Future<void> getTdExos(int tdId) async {
    Uri url = Uri.parse("http://localhost:8000/problem-set/exo/$tdId");

    String token = storage.read("token");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Bearer $token",
    };

    try {
      var response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        for (var exercise in json.decode(utf8.decode(response.bodyBytes))) {
          exos.add(Exo.fromJson(exercise));
        }
        updateStarterCode();
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

  String hiddenCode = '';
  void updateStarterCode() {
    final List<String> parts =
        exos[exoIndex].startCode!.split('// Below Is Irrelevant For YOU. ');

    startCode = parts[0];
    hiddenCode = parts[1];
    codeController?.text = startCode!;
    update();
    onInit();
  }

  void incrementIndex() {
    exoIndex = ++exoIndex % exos.length;
    update();
  }

  void decrementIndex() {
    exoIndex = exoIndex == 0 ? exos.length - 1 : --exoIndex % exos.length;
    update();
  }
}
