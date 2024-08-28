import 'package:final_app/bind/home_bind.dart';
import 'package:final_app/screen/home_screen.dart';
import 'package:final_app/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      initialRoute: 'home',
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen(), binding: HomeBind()),
        GetPage(name: '/login', page: () => LoginScreen()),
      ],
    ),
  );
}
