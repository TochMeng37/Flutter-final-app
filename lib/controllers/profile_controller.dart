import 'package:final_app/model/current_user_model.dart';
import 'package:final_app/services/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final _apiHelper = ApiHelper();
  final box = GetStorage();
  CurrentUserResponse users = CurrentUserResponse();
  bool isLoding = false;
  @override
  void onInit() {
    getAccountUsers();
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

  void setToken(String token) async {
    await box.write("access_token", token);
  }
}
