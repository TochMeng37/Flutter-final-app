import 'package:final_app/constant/constant.dart';
import 'package:final_app/controllers/add_tocard.dart';
import 'package:final_app/controllers/product_controller.dart';
import 'package:final_app/widget/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PC CENTRAL",
                        style: AppWidget.boldTextFeildStyle(),
                      ),
                      Text(
                        "Welcome to Shop",
                        style: AppWidget.lightTextFeildStyle(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const SizedBox(height: 5.0),

              // Wrapping ListView.builder inside a Container with height
              Container(
                height: Get.height, // Specify a fixed height
                child: GetBuilder<ProductController>(
                  builder: (context) {
                    return ListView.builder(
                      itemCount: controller.card.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4.0,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                    "${controller.card[index].productName}"),
                                subtitle:
                                    Text("${controller.card[index].price} USD"),
                                trailing: Icon(Icons.favorite_outline),
                              ),
                              Container(
                                height: 200.0,
                                child: Image.network(
                                    'http://192.168.100.39:8000/products/${controller.card[index].image}'),
                              ),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    '${controller.card[index].description}'),
                              ),
                              ButtonBar(
                                children: [
                                  TextButton(
                                    child: const Text("Cancel"),
                                    onPressed: () {
                                      // Implement cancel action
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Buy'),
                                    onPressed: () {
                                      // Implement buy action
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
