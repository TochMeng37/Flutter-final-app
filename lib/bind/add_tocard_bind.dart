import 'package:final_app/controllers/add_tocard.dart';
import 'package:get/get.dart';

class AddTocardBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddTocard());
  }
}
