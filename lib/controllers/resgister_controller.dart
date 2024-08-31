import 'dart:io';

import 'package:final_app/services/api_helper.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ResgisterController extends GetxController {
  final _apiHelper = ApiHelper();
  File? Profile;
  final _ImagePik = ImagePicker();

  void Register({
    required String name,
    required String email,
    required String password,
    File? profile
  }) async {
    print("value${name + password + email}");
    try {
      final response = await _apiHelper.registerUser(
          name: name, email: email, password: password, profile: profile);
      Get.snackbar("Message", response.toString());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void SelectProfile() async{
    final pickedFile = await _ImagePik.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      Profile = File(pickedFile.path);
      update();
      print("have images");
    }else{
      print("dont have");
    }
  }
}
