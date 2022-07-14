import 'package:get/get.dart';

class BmicalculatorController extends GetxController {
  //başlangıç değerleri parametreler cinsiyet vs.
  var isBusy = false.obs;
  final gender = 0.obs;
  final height = 150.obs;
  final age = 30.obs;
  final weight = 50.obs;
  final isFinished = false.obs;
  final bmiScore = 0.0.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
