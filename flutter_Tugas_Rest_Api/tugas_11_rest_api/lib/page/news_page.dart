import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_11_rest_api/page/home_page.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Action tombol kembali
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar utama
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  height: 375,
                  width: 375,
                  'assets/image/Bg_Image_News.png', // Ganti dengan path gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),

              // Informasi Penulis
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/icon/icon_samuel.png'), // Avatar penulis
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Samuel Newtor',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '17 June 2023 — 4:49 PM',
                        style: GoogleFonts.poppins(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20.0),
              SizedBox(height: 16.0),

              // Kategori Artikel
              Text(
                'TECHNOLOGY',
                style: GoogleFonts.poppins(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Judul Artikel
              Text(
                'To build responsibly, tech \n needs to do more than just \n hire chief ethics officers',
                style: GoogleFonts.poppins(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w900,
                ),
              ),

              SizedBox(height: 20.0),

              // Isi Artikel
              Text(
                'In the last couple of years, we’ve seen \n new teams in tech companies emerge \n that focus on responsible innovation,\n digital well-being, AI ethics or humane \n use. Whatever their titles, these \n individuals are given the task of \n “leading” ethics at their companies.',
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
