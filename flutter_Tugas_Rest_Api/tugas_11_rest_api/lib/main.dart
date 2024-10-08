import 'package:flutter/material.dart';
import 'package:tugas_11_rest_api/user/page/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'api flutter',
        home: UserPage());
  }
}
