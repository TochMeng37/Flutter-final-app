import 'dart:io';

import 'package:final_app/services/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart'; // Ensure this import exists

class EditeController extends GetxController{
  final _apiHelper = ApiHelper();
  final box = GetStorage();
  bool isLoding = false;
  File? Profile;
  final _ImagePik = ImagePicker();

  void updateProduct({required String productID , required String productName,required String description,required String price}) async{
    try{
      final token = box.read("access_token");
      final  response = await _apiHelper.updateProduct(productName: productName, description: description, price: price, productID: productID, token: token);
      Get.snackbar("Message", "Prduct has benn Update");
    }catch(e){
      isLoding = false;
      throw Exception("Somting Wroing");
    }
  }


  void SelectProduct() async{
    final pickedFile = await _ImagePik.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      Profile = File(pickedFile.path);
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
