import 'package:get/get.dart';
import 'package:onsr/controllers/login_controller.dart';

import '../controllers/splash_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}