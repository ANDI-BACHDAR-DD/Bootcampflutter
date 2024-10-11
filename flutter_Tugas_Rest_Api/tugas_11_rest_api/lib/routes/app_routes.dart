import 'package:get/get.dart';
import 'package:tugas_11_rest_api/page/get_started.dart';
import 'package:tugas_11_rest_api/page/login_page.dart';
import 'package:tugas_11_rest_api/page/register_page.dart';
import 'package:tugas_11_rest_api/page/home_page.dart';
import 'package:tugas_11_rest_api/routes/app_routes_named.dart'; // Import AppRoutesNamed

class AppRoutes {
  static final routes = [
    GetPage(name: AppRoutesNamed.getStarted, page: () => GetStarted()),
    GetPage(name: AppRoutesNamed.loginScreen, page: () => LoginScreen()),
    GetPage(name: AppRoutesNamed.registerScreen, page: () => RegisterScreen()),
    GetPage(name: AppRoutesNamed.homePage, page: () => HomePage()),
  ];
}
