import 'package:final_app/controllers/product_controller.dart';
import 'package:final_app/screen/detail_screen.dart';
import 'package:final_app/widget/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshData();
        },
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "images/B&G_Squre.png",
                        height: 75,
                        width: 75,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("All Product",
                        style: AppWidget.semiboldTextFeildStyle()),
                    const Text(
                      "See all",
                      style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: Get.height, // Specify a fixed height
                  child: GetBuilder<ProductController>(
                    builder: (context) {
                      return ListView.builder(
                        itemCount: controller.product.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 4.0,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                      "${controller.product[index].productName}"),
                                  subtitle: Text(
                                      "${controller.product[index].price} USD"),
                                  trailing: Icon(Icons.favorite_outline),
                                ),
                                Container(
                                  height: 200.0,
                                  child: Image.network(
                                      'http://10.0.2.2:8000/products/${controller.product[index].image}'),
                                ),
                                Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      '${controller.product[index].description}'),
                                ),
                                ButtonBar(
                                  children: [
                                    TextButton(
                                      child: const Text('View'),
                                      onPressed: () {
                                        controller.getOne(
                                            productID: controller
                                                .product[index].id
                                                .toString());
                                        Get.to(() => DetailScreen());
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
      ),
    );
  }
}
