import 'dart:convert';

import 'package:final_app/model/current_user_model.dart';
import 'package:final_app/model/product_model.dart';
import 'package:final_app/services/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  final _apiHelper = ApiHelper();
  final box = GetStorage();
  ProductResponse _product = ProductResponse();
  bool isLoding = false;

  List<DataResponse> get product => _product.data ?? [];
  @override
  void onInit() {
    getAllPro();
    super.onInit();
  }

  void getAllPro() async {
    try {
      isLoding = true;
      update();
      final tokens = box.read("access_token");
      final response = await _apiHelper.getallProducts(token: tokens);
      _product = response;
      print("Product${jsonEncode(_product.data?.length)}");
      isLoding = false;
      update();
    } catch (e) {
      isLoding = false;
      update();
      if (e.toString().contains('401')) {
        Get.snackbar("Error", "Invalid credentials. Please log in again.");
      }
      update();
    }
  }

  void setToken(String token) async {
    await box.write("access_token", token);
  }
}
