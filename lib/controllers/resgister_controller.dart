import 'package:final_app/services/api_helper.dart';
import 'package:get/get.dart';

class ResgisterController extends GetxController {
  final _apiHelper = ApiHelper();

  void Register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiHelper.registerUser(
          name: name, email: email, password: password);
      print(response);
      Get.snackbar("Message", response.toString());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
