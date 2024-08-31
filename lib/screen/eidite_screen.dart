import 'package:final_app/constant/constant.dart';
import 'package:final_app/controllers/detail_controller.dart';
import 'package:final_app/controllers/profile_controller.dart';
import 'package:final_app/widget/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:quickalert/quickalert.dart';

class EiditeScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());
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
              child: GetBuilder<ProfileController>(
                builder: (context) {
                  return GestureDetector(
                    onTap: (){
                      controller.SelectProduct();
                    },
                    child:CircleAvatar(
                      radius: 50, // Adjust the radius as needed
                      backgroundImage: controller.Product != null
                          ? FileImage(controller.Product!)
                          : controller.detailRes.data?.image != null
                          ? NetworkImage("http://10.0.2.2:8000/products/${controller.detailRes.data?.image}")
                          : null,
                      child: controller.Product == null && controller.detailRes.data?.image == null
                          ? Icon(Icons.person) // Placeholder icon if no image is available
                          : null,
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
                        controller.updateProduct(productID: controller.detailRes.data!.id.toString(), productName: _productNameController.text, description: _descriptionController.text, price: _priceController.text, photo: controller.Product);
                        Get.back();
                    },
                    height: 45,
                    color: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "Edite Product",
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
