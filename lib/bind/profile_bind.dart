import 'package:final_app/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
