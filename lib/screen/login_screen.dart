import 'package:final_app/controllers/login_controller.dart';
import 'package:final_app/screen/register_screen.dart';
import 'package:final_app/widget/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
              top: 99.0, left: 20.0, right: 20.0, bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "images/B&G_Squre.png",
                  height: 150,
                  width: 300,
                ),
              ),
              Center(
                child: Text(
                  "Login",
                  style: AppWidget.semiboldTextFeildStyle(),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                "Email",
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F5F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Please Input The Email",
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Password",
                style: AppWidget.semiboldTextFeildStyle(),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F5F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Please Input The Password",
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20)),
                  child: InkWell(
                    onTap: () {
                      controller.login(
                          email: emailController.text,
                          password: passwordController.text);
                    },
                    child: const Center(
                        child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppWidget.lightTextFeildStyle(),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => RegisterScreen());
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.lightGreen,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
