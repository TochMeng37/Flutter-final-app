import 'package:final_app/bind/home_bind.dart';
import 'package:final_app/bind/main_binding.dart';
import 'package:final_app/screen/eidite_screen.dart';
import 'package:final_app/screen/home_screen.dart';
import 'package:final_app/screen/login_screen.dart';
import 'package:final_app/screen/main_screen.dart';
import 'package:final_app/screen/post_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      initialRoute: 'login',
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen(), binding: HomeBind()),
        GetPage(name: '/main', page: ()=> MainScreen(),binding: MainBinding()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/edite', page: () => EiditeScreen()),
        GetPage(name: '/productAdd', page: ()=> PostProductScreen()),
      ],
    ),
  );
}
