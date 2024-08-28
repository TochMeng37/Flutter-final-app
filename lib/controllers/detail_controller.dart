import 'package:final_app/model/detail_model.dart';
import 'package:final_app/services/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  final ApiHelper api = ApiHelper();
  final GetStorage box = GetStorage(); // Initialize with empty data
  bool isLoading = true;
  bool prLoading = true;
  DetailDataModel detailRes = DetailDataModel();

  Future<void> getOne({required String productID}) async {
    try {
      final token = box.read("access_token");
      final response = await api.showOne(token: token, productID: productID);
      detailRes = response;
      update();
      prLoading = false;
    } catch (e) {
      Get.snackbar("Get Data", e.toString());
    }
  }

  Future<void> getTocart({required String productID}) async {
    try {
      final token = box.read("access_token");
      final response = await api.addToCard(token: token, productID: productID);
      detailRes = response;
      update();
      prLoading = false;
    } catch (e) {
      Get.snackbar("Get Data", e.toString());
    }
  }
}
