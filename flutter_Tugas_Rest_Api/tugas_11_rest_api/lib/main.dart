import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_11_rest_api/firebase_options.dart';
//import 'package:tugas_11_rest_api/page/login_page.dart';
import 'package:tugas_11_rest_api/user/page/user_page.dart';

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
        debugShowCheckedModeBanner: false,
        title: 'register page dan login page',
        home: UserPage());
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tugas_11_rest_api/user/page/user_page.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: UserPage(),
//     );
//   }
// }

