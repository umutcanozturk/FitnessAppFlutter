import 'package:get/get.dart';

import '../controllers/scorescreen_controller.dart';

class ScorescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScorescreenController>(
      () => ScorescreenController(),
    );
  }
}
