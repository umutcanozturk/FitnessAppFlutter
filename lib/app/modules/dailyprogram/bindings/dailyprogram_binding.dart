import 'package:get/get.dart';

import '../controllers/dailyprogram_controller.dart';

class DailyprogramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyprogramController>(
      () => DailyprogramController(),
    );
  }
}
