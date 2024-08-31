import 'package:final_app/constant/constant.dart';
import 'package:final_app/controllers/profile_controller.dart';
import 'package:final_app/screen/eidite_screen.dart';
import 'package:final_app/screen/post_product_screen.dart';
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
              const SizedBox(height: 20),
              Center(
                child: GetBuilder<ProfileController>(
                  builder: (context) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(
                          'http://10.0.2.2:8000/profile/${controller.users.profileUrl}',
                          scale: 1.0),
                      radius: 100,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding:const EdgeInsets.all(10.0),
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
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding:const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(()=> PostProductScreen());
                    },
                    child: const Center(
                      child: Text(
                        "Add Product",
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
              SizedBox(
                height: Get.height, // Specify a fixed height
                child: GetBuilder<ProfileController>(
                  builder: (context) {
                    return ListView.builder(
                      itemCount: controller.resonwer.res?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4.0,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                    "${controller.resonwer.res?[index].productName}"),
                                subtitle: Text(
                                    "${controller.resonwer.res?[index].price} USD"),
                                trailing: const Icon(Icons.favorite_outline),
                              ),
                              SizedBox(
                                height: 200.0,
                                child: Image.network(
                                    'http://10.0.2.2:8000/products/${controller.resonwer.res?[index].image}'),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    '${controller.resonwer.res?[index].description}'),
                              ),
                              ButtonBar(
                                children: [
                                  TextButton(
                                    child: const Text('Edite'),
                                    onPressed: () {
                                      controller.getOne(productID: controller.resonwer.res![index].id.toString());
                                      Get.to(() => EiditeScreen());
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
