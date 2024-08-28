import 'package:final_app/widget/support_widget.dart';
import 'package:flutter/material.dart';

class AddTocardScreen extends StatelessWidget {
  const AddTocardScreen({super.key, required int height});
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
              const SizedBox(height: 90.0),
            ],
          ),
        ),
      ),
    );
  }
}
