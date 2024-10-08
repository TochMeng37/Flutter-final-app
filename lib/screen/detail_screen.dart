import 'package:animate_do/animate_do.dart';
import 'package:final_app/controllers/product_controller.dart';
import 'package:final_app/screen/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductController>(builder: (_) {
        return Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {},
                child: FadeInUp(
                    duration: Duration(milliseconds: 800),
                    child: Container(
                      width: double.infinity,
                      height: 600,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://10.0.2.2:8000/products/${controller.detailRes.data?.image}"),
                            fit: BoxFit.cover),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                              Colors.grey.shade700.withOpacity(.9),
                              Colors.grey.withOpacity(.0),
                            ])),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeInUp(
                                duration: Duration(milliseconds: 1000),
                                child: Container(
                                  width: 90,
                                  margin: EdgeInsets.only(bottom: 60),
                                  // child: Row(
                                  //   children: _buildIndicator(),
                                  // ),
                                ))
                          ],
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: Transform.translate(
                  offset: Offset(0, -40),
                  child: FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: [
                                FadeInUp(
                                    duration: Duration(milliseconds: 1300),
                                    child: Text(
                                      "${controller.detailRes.data?.productName}",
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    FadeInUp(
                                        duration: Duration(milliseconds: 1400),
                                        child: Text(
                                          "${controller.detailRes.data?.price} USD",
                                          style: TextStyle(
                                              color: Colors.lightGreen,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    FadeInUp(
                                        duration: Duration(milliseconds: 1500),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.lightGreen,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.lightGreen,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.lightGreen,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.lightGreen,
                                            ),
                                            Icon(
                                              Icons.star_half,
                                              size: 18,
                                              color: Colors.lightGreen,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "(4.2/70 reviews)",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            FadeInUp(
                              duration: Duration(milliseconds: 1700),
                              child: MaterialButton(
                                onPressed: () {
                                  controller.getTocart(
                                    productID: controller.detailRes.data!.id
                                        .toString(),
                                  );
                                },
                                height: 45,
                                color: Colors.lightGreen,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Text(
                                    "ADD TO CART",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
