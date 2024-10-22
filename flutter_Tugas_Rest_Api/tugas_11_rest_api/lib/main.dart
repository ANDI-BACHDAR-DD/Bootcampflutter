import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_11_rest_api/firebase_options.dart';
import 'package:tugas_11_rest_api/page/get_started.dart';
import 'package:tugas_11_rest_api/page/home_page.dart';
import 'package:tugas_11_rest_api/page/news_page.dart';
import 'package:tugas_11_rest_api/routes/app_routes.dart';
import 'package:tugas_11_rest_api/routes/app_routes_named.dart'; // Pastikan path ini sesuai

//import 'package:tugas_11_rest_api/page/login_page.dart';
//import 'package:tugas_11_rest_api/user/page/user_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: AppRoutesNamed.getStarted, // Rute awal aplikasi
        getPages: AppRoutes.routes, // Mengatur rute yang sudah didefinisikan
        //getPages: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
        title: 'register page dan login page',
        home: GetStarted());
  }
}
