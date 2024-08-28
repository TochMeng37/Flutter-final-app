import 'package:final_app/controllers/resgister_controller.dart';
import 'package:final_app/screen/login_screen.dart';
import 'package:final_app/widget/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ResgisterController());
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
              top: 30.0, left: 20.0, right: 20.0, bottom: 40.0),
          child: Form(
            key: formKey, // Added Form widget
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
                    "Sign up",
                    style: AppWidget.semiboldTextFeildStyle(),
                  ),
                ),
                const SizedBox(height: 10.0),
                Center(
                  child: Text(
                    "Welcome To Login App PC Central!",
                    style: AppWidget.lightTextFeildStyle(),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Username",
                  style: AppWidget.semiboldTextFeildStyle(),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F5F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Please Input The Username",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Email",
                  style: AppWidget.semiboldTextFeildStyle(),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F5F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Please Input The Email",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
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
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Please Input The Password",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        _controller.Register(
                            name: name, email: email, password: password);
                      },
                      child: const Center(
                        child: Text(
                          "Signup",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22.0),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "have an account? ",
                        style: AppWidget.lightTextFeildStyle(),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => LoginScreen());
                            },
                            child: const Text(
                              "Login",
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
