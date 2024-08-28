import 'package:final_app/constant/constant.dart';
import 'package:final_app/controllers/profile_controller.dart';
import 'package:final_app/widget/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfielScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<ProfileController>(
                        builder: (context) {
                          return Text(
                            "Hey, ${controller.users.name}",
                            style: AppWidget.boldTextFeildStyle(),
                          );
                        },
                      ),
                      Text(
                        "Welcome to PC Central",
                        style: AppWidget.lightTextFeildStyle(),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "images/banner.png",
                      height: 70,
                      width: 140,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: GetBuilder<ProfileController>(
                  builder: (context) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(
                          'http://192.168.100.39:8000/profile/${controller.users.profileUrl}',
                          scale: 1.0),
                      radius: 100,
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: GetBuilder<ProfileController>(
                  builder: (context) {
                    return Text(
                      "Email  : ${controller.users.name}",
                      style: AppWidget.boldTextFeildStyle(),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Center(
                child: GetBuilder<ProfileController>(
                  builder: (context) {
                    return Text(
                      "Email  : ${controller.users.email}",
                      style: AppWidget.boldTextFeildStyle(),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      controller.logout();
                    },
                    child: const Center(
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
