import 'package:firebase_core/firebase_core.dart';
import 'package:fitnessapp/app/services/auth-service.dart';
import 'package:fitnessapp/firebase_options.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  //firebase dahil ediliyor
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    //getx kütüphanesi dahil edilerek material app  çağırılıyor
    GetMaterialApp(
      title: "Application",
      initialBinding: BindingsBuilder(
        () {
          //auth service i ayağa kaldırılıyor
          Get.put(AuthService());
        },
      ),
      //rotalar tanımlanıyor
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
