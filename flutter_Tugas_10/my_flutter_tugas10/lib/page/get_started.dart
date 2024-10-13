import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_tugas10/page/home_page.dart';
//import 'package:tugas_11_rest_api/page/login_page.dart';
//import 'package:tugas_11_rest_api/page/register_page.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 86),
                width: double.infinity,
                height: 330,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/image_news.png'))),
              ),
              SizedBox(
                height: 37,
              ),
              Text(
                'Yuk, Membaca Bersama\nSanber News',
                style: GoogleFonts.arimo(
                    fontSize: 21, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                'Berita Terpercaya, Di Ujung Jari Anda',
                style: TextStyle(fontSize: 15),
              ),
              Spacer(),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (route) => false);
                      //Get.to(() => LoginScreen());
                      //Get.toNamed('/halaman-login');
                    },
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.arimo(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff3498DB),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
              ),
              SizedBox(
                height: 21,
              ),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      //Get.to(() => RegisterScreen());
                      //Get.toNamed('/halaman-register');
                    },
                    child: Text(
                      'Mendaftar',
                      style: GoogleFonts.arimo(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3498DB)),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Color(0xff3498DB)),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
