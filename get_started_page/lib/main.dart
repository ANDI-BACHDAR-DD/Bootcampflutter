import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(GetStartedPage());
}

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 86),
                  width: double.infinity,
                  height: 330,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/image-news.png'))),
                ),
                SizedBox(height: 37),
                Text(
                  'Yuk, Membaca Bersama\n Sanber News',
                  style: GoogleFonts.arimo(
                      fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 21,
                ),
                Text(
                  'Berita Terpercaya, Di Ujung Jari Anda',
                  style: TextStyle(fontSize: 14),
                ),
                Spacer(),
                SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.arimo(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff3898Db),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Mendaftar',
                      style: GoogleFonts.arimo(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3898Db)),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Color(0xff3898DB)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
