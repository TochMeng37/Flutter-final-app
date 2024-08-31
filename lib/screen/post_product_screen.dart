import 'package:final_app/constant/constant.dart';
import 'package:final_app/controllers/detail_controller.dart';
import 'package:final_app/controllers/product_add.dart';
import 'package:final_app/controllers/profile_controller.dart';
import 'package:final_app/screen/home_screen.dart';
import 'package:final_app/widget/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:quickalert/quickalert.dart';

class PostProductScreen extends StatelessWidget {
  final controller = Get.put(ProductAdd());
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 90.0,
                ),
                SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: GetBuilder<ProductAdd>(
                      builder: (context) {
                        return GestureDetector(
                          onTap: (){
                            controller.SelectProduct();
                          },
                          child:CircleAvatar(
                            radius: 50, // Adjust the radius as needed
                            backgroundImage: controller.Product != null
                                ? FileImage(controller.Product!)
                                : null, // No background image if Product is null
                            child: controller.Product == null
                                ? Icon(Icons.add_a_photo) // Show placeholder icon when no image is selected
                                : null, // No child when an image is selected
                          ),
                        );
                      }
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Prodcuct Name', prefixIcon: Icon(Icons.production_quantity_limits),border: OutlineInputBorder()),
                        controller: _productNameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Description', prefixIcon: Icon(Icons.accessibility),border: OutlineInputBorder()),
                        controller: _descriptionController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Price', prefixIcon: Icon(Icons.price_change_outlined),border: OutlineInputBorder()),
                        controller: _priceController,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      MaterialButton(
                        onPressed: () {
                            controller.Addproduct(description: _descriptionController.text, price: _priceController.text, productName: _productNameController.text, photo: controller.Product);
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                            );
                            
                           Get.back();
                        },
                        height: 45,
                        color: Colors.lightGreen,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            "Add Product",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          controller.Remake();
                          Get.back();
                        },
                        height: 45,
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            "Back",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
