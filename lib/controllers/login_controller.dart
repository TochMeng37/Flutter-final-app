import 'dart:convert';

import 'package:final_app/services/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final _apiHelper = ApiHelper();
  final box = GetStorage();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _apiHelper.login(email: email, password: password);
      setToken(user.accessToken!);
      Future.delayed(const Duration(seconds: 1));
      Get.snackbar("Message", "Success!");
      Get.offAllNamed('/home');
    } catch (e) {
      if (e.toString().contains('401')) {
        Get.snackbar("Error", "Invalid credentials");
      } else {
        Get.snackbar("Error", e.toString());
      }
    }
  }

  void setToken(String token) async {
    await box.write("access_token", token);
  }
}
