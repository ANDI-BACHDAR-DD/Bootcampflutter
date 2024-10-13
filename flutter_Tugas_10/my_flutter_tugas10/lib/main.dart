// import 'package:flutter/material.dart';
// import 'package:my_flutter_tugas10/page/get_started.dart';
// // Pastikan path ini sesuai

// //import 'package:tugas_11_rest_api/page/login_page.dart';
// //import 'package:tugas_11_rest_api/user/page/user_page.dart';

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp(
// //     options: DefaultFirebaseOptions.currentPlatform,
// //   );
// //   runApp(const MyApp());
// // }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         // initialRoute: AppRoutesNamed.getStarted, // Rute awal aplikasi
//         // getPages: AppRoutes.routes, // Mengatur rute yang sudah didefinisikan
//         //getPages: AppRoutes.routes,
//         debugShowCheckedModeBanner: false,
//         title: 'register page dan login page',
//         home: GetStarted());
//   }
// }
import 'package:flutter/material.dart';
import 'package:my_flutter_tugas10/page/get_started.dart';
//import 'package:my_flutter_tugas10/page/get_started_page.dart'; // Pastikan Anda mengimpor halaman awal Anda

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetStarted(), // Pastikan ini adalah halaman utama Anda
    );
  }
}
