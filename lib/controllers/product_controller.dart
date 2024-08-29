import 'dart:convert';
import 'dart:io';

import 'package:final_app/model/card_add_model.dart';
import 'package:final_app/model/current_user_model.dart';
import 'package:final_app/model/detail_model.dart';
import 'package:final_app/model/product_model.dart';
import 'package:final_app/services/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  final _apiHelper = ApiHelper();
  final box = GetStorage();
  ProductResponse _product = ProductResponse();
  bool isLoding = false;
  DetailDataModel detailRes = DetailDataModel();
  AddCardResponse _card = AddCardResponse();
  List<Products> get card => _card.products ?? [];
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

  Future<void> getOne({required String productID}) async {
    try {
      final token = box.read("access_token");
      final response =
          await _apiHelper.showOne(token: token, productID: productID);
      detailRes = response;
      update();
    } catch (e) {
      Get.snackbar("Get Data", e.toString());
    }
  }

  void getTocart({required String productID}) async {
    try {
      final token = box.read("access_token");
      final response =
          await _apiHelper.addToCard(token: token, productID: productID);
      Get.snackbar("Buy Products", "Your products will be available");
      getBuys();
      update();
    } catch (e) {
      Get.snackbar("Get Data", e.toString());
    }
  }

  void getBuys() async {
    isLoding = true;
    update();
    try {
      final token = box.read("access_token");
      final response = await _apiHelper.getBuy(token: token);
      _card = response;
      isLoding = false;
      update();
    } catch (e) {
      isLoding = false;
      update();
      Get.snackbar("Get Data", e.toString());
    }
  }

  void setToken(String token) async {
    await box.write("access_token", token);
  }
}
