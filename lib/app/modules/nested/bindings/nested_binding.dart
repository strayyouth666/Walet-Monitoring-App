import 'package:get/get.dart';

import '../controllers/nested_controller.dart';

class NestedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NestedController>(
      () => NestedController(),
    );
  }
}
