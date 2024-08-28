import 'package:final_app/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
