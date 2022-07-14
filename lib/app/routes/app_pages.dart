import 'package:get/get.dart';

import '../modules/bmicalculator/bindings/bmicalculator_binding.dart';
import '../modules/bmicalculator/views/bmicalculator_view.dart';
import '../modules/dailyprogram/bindings/dailyprogram_binding.dart';
import '../modules/dailyprogram/views/dailyprogram_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/scorescreen/bindings/scorescreen_binding.dart';
import '../modules/scorescreen/views/scorescreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
//sayfalar controllerları ve o controllerların view'a eklenmesini sağlayan binding classlarıyla tanımlanıyor, isimleri ise app_routes classında statik olarak tutuluyor.
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BMICALCULATOR,
      page: () => const BmicalculatorView(),
      binding: BmicalculatorBinding(),
    ),
    GetPage(
      name: _Paths.SCORESCREEN,
      page: () => const ScorescreenView(),
      binding: ScorescreenBinding(),
    ),
    GetPage(
      name: _Paths.DAILYPROGRAM,
      page: () => const DailyprogramView(),
      binding: DailyprogramBinding(),
    ),
  ];
}
