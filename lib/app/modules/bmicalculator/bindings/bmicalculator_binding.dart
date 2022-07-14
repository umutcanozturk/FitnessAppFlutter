import 'package:get/get.dart';

import '../controllers/bmicalculator_controller.dart';

class BmicalculatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BmicalculatorController>(
      () => BmicalculatorController(),
    );
  }
}
