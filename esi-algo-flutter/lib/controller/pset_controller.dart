import 'dart:convert';

import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../model/pset.dart';

class PsetController extends GetxController {
  RxList<Pset> pset = RxList<Pset>.empty();

  Future<void> getTds() async {
    Uri url = Uri.parse("http://localhost:8000/problem-set/td/all");

    GetStorage storage = GetStorage();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Bearer ${storage.read("token")}",
    };

    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        List<dynamic> decodedResponse =
            json.decode(utf8.decode(response.bodyBytes));
        List<Pset> newPsetList =
            decodedResponse.map((problem) => Pset.fromJson(problem)).toList();
        updatePsetList(newPsetList);
      }
    } catch (exception) {
      // Handle exception
    }
  }

  void updatePsetList(List<Pset> newPsetList) {
    pset.clear();
    pset.addAll(newPsetList);
  }
}
