import 'dart:io';

//Soal nomor 1
// void main() {
//   // Meminta input dari pengguna
//   stdout.write('Apakah Anda mau menginstall aplikasi? (Y/T): ');
//   String? jawaban = stdin.readLineSync()?.toUpperCase();

//   // Menggunakan ternary operator untuk mengecek jawaban
//   String hasil = (jawaban == 'Y')
//       ? 'Anda akan menginstall aplikasi Dart.'
//       : (jawaban == 'T')
//           ? 'Aborted.'
//           : 'Input tidak valid.';

//   // Menampilkan hasil
//   print(hasil);
// }

//Soal nomor 2

// void main() {
//   // Meminta input untuk nama
//   stdout.write('Masukkan nama: ');
//   String? nama = stdin.readLineSync();

//   // Meminta input untuk peran
//   stdout.write('Masukkan peran (Penyihir/Guard/Werewolf): ');
//   String? peran = stdin.readLineSync();

//   // Mengecek kondisi input
//   if (nama == null || nama.isEmpty) {
//     print('Nama harus diisi!');
//   } else if (peran == null || peran.isEmpty) {
//     print('Halo $nama, Pilih peranmu untuk memulai game!');
//   } else if (peran.toLowerCase() == 'penyihir') {
//     print('Selamat datang di Dunia Werewolf, $nama');
//     print(
//         'Halo Penyihir $nama, kamu dapat melihat siapa yang menjadi werewolf!');
//   } else if (peran.toLowerCase() == 'guard') {
//     print('Selamat datang di Dunia Werewolf, $nama');
//     print(
//         'Halo Guard $nama, kamu akan membantu melindungi temanmu dari serangan werewolf.');
//   } else if (peran.toLowerCase() == 'werewolf') {
//     print('Selamat datang di Dunia Werewolf, $nama');
//     print('Halo Werewolf $nama, Kamu akan memakan mangsa setiap malam!');
//   } else {
//     print('Peran yang kamu masukkan tidak dikenal!');
//   }
// }

//soal nomor 3

// void main() {
//   // Meminta input hari dari pengguna
//   stdout.write('Masukkan hari (Senin/Minggu): ');
//   String? hari = stdin.readLineSync()?.toLowerCase();

//   // Menggunakan switch case untuk memberikan quotes berdasarkan hari
//   switch (hari) {
//     case 'senin':
//       print(
//           'Segala sesuatu memiliki kesudahan, yang sudah berakhir biarlah berlalu dan yakinlah semua akan baik-baik saja.');
//       break;
//     case 'selasa':
//       print(
//           'Setiap detik sangatlah berharga karena waktu mengetahui banyak hal, termasuk rahasia hati.');
//       break;
//     case 'rabu':
//       print(
//           'Jika kamu tak menemukan buku yang kamu cari di rak, maka tulislah sendiri.');
//       break;
//     case 'kamis':
//       print(
//           'Jika hatimu banyak merasakan sakit, maka belajarlah dari rasa sakit itu untuk tidak memberikan rasa sakit pada orang lain.');
//       break;
//     case 'jumat':
//       print('Hidup tak selamanya tentang pacar.');
//       break;
//     case 'sabtu':
//       print('Rumah bukan hanya sebuah tempat, tetapi itu adalah perasaan.');
//       break;
//     case 'minggu':
//       print(
//           'Hanya seseorang yang takut yang bisa bertindak berani. Tanpa rasa takut itu tidak ada apapun yang bisa disebut berani.');
//       break;
//     default:
//       print('Hari yang Anda masukkan tidak valid.');
//   }
// }

//soal nomor 4
// void main() {
//   var tanggal = 1; // assign nilai variabel tanggal (antara 1 - 31)
//   var bulan = 05; // assign nilai variabel bulan (antara 1 - 12)
//   var tahun = 1945; // assign nilai variabel tahun (antara 1900 - 2200)

//   String namaBulan;

//   // Menggunakan switch case untuk menentukan nama bulan berdasarkan angka
//   switch (bulan) {
//     case 1:
//       namaBulan = 'Januari';
//       break;
//     case 2:
//       namaBulan = 'Februari';
//       break;
//     case 3:
//       namaBulan = 'Maret';
//       break;
//     case 4:
//       namaBulan = 'April';
//       break;
//     case 5:
//       namaBulan = 'Mei';
//       break;
//     case 6:
//       namaBulan = 'Juni';
//       break;
//     case 7:
//       namaBulan = 'Juli';
//       break;
//     case 8:
//       namaBulan = 'Agustus';
//       break;
//     case 9:
//       namaBulan = 'September';
//       break;
//     case 10:
//       namaBulan = 'Oktober';
//       break;
//     case 11:
//       namaBulan = 'November';
//       break;
//     case 12:
//       namaBulan = 'Desember';
//       break;
//     default:
//       namaBulan = 'Bulan tidak valid';
//   }

//   // Menampilkan hasil format tanggal
//   if (tanggal >= 1 &&
//       tanggal <= 31 &&
//       tahun >= 1900 &&
//       tahun <= 2200 &&
//       namaBulan != 'Bulan tidak valid') {
//     print('$tanggal $namaBulan $tahun');
//   } else {
//     print('Input tanggal atau bulan tidak valid.');
//   }
// }

import 'dart:io';

void main() {
  // Meminta input dari pengguna
  stdout.write('Apakah Anda ingin menginstall aplikasi? (Y/T): ');
  String? input = stdin.readLineSync()?.toLowerCase();

  // Menggunakan ternary untuk menentukan output
  String hasil = (input == 'T')
      ? 'Anda akan menginstall aplikasi dart'
      : (input == 'T')
          ? 'Aborted'
          : 'Input tidak valid';

  // Menampilkan hasil
  print(hasil);
}
