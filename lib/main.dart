import 'package:chatdemo/models/user_controller.dart';
import 'package:chatdemo/modules/signin_page/signin_binding.dart';
import 'package:chatdemo/modules/signin_page/signin_controller.dart';
import 'package:chatdemo/modules/signup_page/signup_controller.dart';
import 'package:chatdemo/routes/routes.dart';
import 'package:chatdemo/services/auth/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<AuthService>(AuthService(), permanent: true);
  Get.put<UserController>(UserController());
  Get.put<SigninController>(SigninController());
  Get.put<SignupController>(SignupController());
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SIGNIN,
      initialBinding: SigninBinding(),
      getPages: AppPages.routes,
    ),
  );
}