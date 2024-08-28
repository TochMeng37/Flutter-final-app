import 'package:final_app/services/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart'; // Ensure this import exists

class LogoutController {
  final _apiHelper = ApiHelper();
  final box = GetStorage();

  Future<void> logout() async {
    try {
      final getToken = box.read("access_token");
      final messgae = await _apiHelper.logout(token: getToken);
      box.remove("access_token");
      Get.snackbar("Message", messgae);
      Get.offAllNamed('/login');
    } catch (e) {
      if (e.toString().contains('401')) {
        Get.snackbar("Error", "Invalid credentials");
      } else {
        Get.snackbar("Error", e.toString());
      }
    }
  }

  void setToken(String token) async {
    await box.write("access_token", token);
  }
}
