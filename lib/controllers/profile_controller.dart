import 'dart:io';

import 'package:final_app/model/current_user_model.dart';
import 'package:final_app/model/detail_model.dart';
import 'package:final_app/model/owner_model.dart';
import 'package:final_app/services/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final _apiHelper = ApiHelper();
  final box = GetStorage();
  CurrentUserResponse users = CurrentUserResponse();
  Resonwer resonwer = Resonwer();
  bool isLoding = false;
  File? Product;
  final _ImagePik = ImagePicker();
  DetailDataModel detailRes = DetailDataModel();
  @override
  void onInit() {
    getAccountUsers();
    getOwner();
    super.onInit();
  }

  void getAccountUsers() async {
    try {
      isLoding = true;
      update();
      final tokens = box.read("access_token");
      final response = await _apiHelper.getUserAccount(token: tokens);
      users = response;
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

  void logout() async {
    try {
      final getToken = box.read("access_token");
      final message = await _apiHelper.logout(token: getToken);
      box.remove("access_token");
      Get.snackbar("Message", message);
      Get.offAllNamed('/login');
    } catch (e) {
      if (e.toString().contains('401')) {
        Get.snackbar("Error", "Invalid credentials. Please log in again.");
      } else {
        Get.snackbar("Error", e.toString());
      }
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

  void updateProduct({required String productID , required String productName,required String description,required String price, photo}) async{
    try{
      final token = box.read("access_token");
      final  response = await _apiHelper.updateProduct(productName: productName, description: description, price: price, productID: productID, token: token);
      Get.snackbar("Message", "Prduct has benn Update");
    }catch(e){
      isLoding = false;
      throw Exception("Somting Wroing");
    }
  }

  void getOwner() async {
    isLoding = true;
    update();
    try{
      final getToken = box.read("access_token");
      final response = await _apiHelper.getOwner(token: getToken);
      resonwer = response;
      isLoding = false;
      update();
    }catch(e){
      isLoding = false;
      update();
      throw Exception("Somting Wroing");
    }
  }
  void Remake() {
    Product = null; // Set the Product variable to null
    update(); // Notify GetX to update the UI
  }
  void SelectProduct() async{
    final pickedFile = await _ImagePik.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      Product = File(pickedFile.path);
      update();
      print("have images");
    }else{
      print("dont have");
    }
  }

  void setToken(String token) async {
    await box.write("access_token", token);
  }
}
