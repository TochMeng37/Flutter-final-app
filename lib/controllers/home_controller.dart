import 'package:final_app/screen/main_screen.dart';
import 'package:final_app/screen/profie_screen.dart';

import 'package:final_app/screen/store_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  int currentIndex = 0;
  @override
  void onReady() {
    isAuthenticated();
  }

  void isAuthenticated() {
    final token = box.read("access_token");
    if (token == null) {
      Get.offAllNamed("/login");
    }
  }

  List<Widget> listScreen = [MainScreen(), StoreScreen(), ProfielScreen()];
  void chengIndex(int index) {
    currentIndex = index;
    update();
  }
}
