import 'package:get/get.dart';

import '../controllers/securitypin_controller.dart';

class SecuritypinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecuritypinController>(
      () => SecuritypinController(),
    );
  }
}
