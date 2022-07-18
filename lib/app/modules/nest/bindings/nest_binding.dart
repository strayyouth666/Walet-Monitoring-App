import 'package:get/get.dart';

import '../controllers/nest_controller.dart';

class NestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NestController>(
      () => NestController(),
    );
  }
}
