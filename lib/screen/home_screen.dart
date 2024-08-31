import 'package:final_app/controllers/detail_controller.dart';
import 'package:final_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: GetBuilder<HomeController>(builder: (controller) {
          return IndexedStack(
            index: controller.currentIndex,
            children: controller.listScreen,
          );
        }),
        bottomNavigationBar: GetBuilder<HomeController>(
          builder: (controller) {
            return CurvedNavigationBar(
              color: Colors.black, // Customize as needed
              backgroundColor: Colors.transparent, // Customize as needed
              buttonBackgroundColor: Colors.lightGreen, // Customize as needed
              height: 60,
              items: const [
                Icon(Icons.home_outlined, color: Colors.white),
                Icon(Icons.shopping_bag_outlined, color: Colors.white),
                Icon(Icons.person_outline, color: Colors.white),
              ],
              onTap: (index) {
                controller.chengIndex(index); // Fixed method name
              },
            );
          },
        ),
      ),
    );
  }
}
