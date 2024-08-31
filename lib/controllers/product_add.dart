import 'dart:io';

import 'package:final_app/model/current_user_model.dart';
import 'package:final_app/model/detail_model.dart';
import 'package:final_app/model/owner_model.dart';
import 'package:final_app/screen/home_screen.dart';
import 'package:final_app/services/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProductAdd extends GetxController {

  final _apiHelper = ApiHelper();
  final box = GetStorage();
  bool isLoding = false;
  File? Product;

  final _ImagePik = ImagePicker();


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

  void Addproduct({required String description,required String price,required String productName, photo}) async{
    try{
      final token = box.read("access_token");
      final response = await _apiHelper.Addproduct(description:description ,price:price ,productName: productName,token: token ,photo: Product);
      Get.snackbar("Message", "Success to Add Product");
    }catch(e){
      throw  Exception("Mesahe");
    }

  }

  void Remake() {
    Product = null; // Set the Product variable to null
    update(); // Notify GetX to update the UI
  }

  void setToken(String token) async {
    await box.write("access_token", token);
  }

  void reloadApp() {
    Get.offAll(() => HomeScreen());
  }
}
