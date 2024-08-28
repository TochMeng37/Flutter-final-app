import 'package:final_app/model/card_add_model.dart';
import 'package:final_app/services/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddTocard extends GetxController {
  final ApiHelper api = ApiHelper();
  final GetStorage box = GetStorage();

  AddCardResponse _card = AddCardResponse();
  bool isLoading = false;

  List<Products> get card => _card.products ?? [];

  @override
  void onInit() {
    super.onInit();
    getBuys();
  }

  void getBuys() async {
    isLoading = true;
    update();
    try {
      final token = box.read("access_token");
      final response = await api.getBuy(token: token);
      _card = response;
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      Get.snackbar("Get Data", e.toString());
    }
  }
}
