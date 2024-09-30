//Soal nomor 1

// void main() {
//   var first = 'dart';
//   var second = 'is';
//   var third = 'awesome';
//   var fourth = 'and';
//   var fifth = 'i';
//   var sixth = 'love';
//   var seventh = 'it!';

//   var sentance =
//       '${first[0].toUpperCase()}${first.substring(1)}$second $third $fourth $fifth $sixth $seventh';
//   print(sentance);
// }
// Pada variabel first, karakter pertama 'd' diubah menjadi huruf kapital menggunakan toUpperCase() dan sisanya diambil dengan substring(1).
// Variabel-variabel lainnya dihubungkan menggunakan interpolasi string ${}.

//Soal nomor 2
// void main() {
//   var sentence = "I am going to be Flutter Developer";
//   var Words = sentence.split(' ');
//   var firstWord = Words[0];
//   var secondWord = Words[1];
//   var thridWord = Words[2];
//   var fourthWord = Words[3];
//   var fifthWord = Words[4];
//   var sixthWord = Words[5];
//   var seventhWord = Words[6];

//   print('First Word: ' + firstWord);
//   print('second Word: ' + secondWord);
//   print('Thrid Word: ' + thridWord);
//   print('Fourth Word: ' + fourthWord);
//   print('Fifth Word: ' + fifthWord);
//   print('Sixth Word: ' + sixthWord);
//   print('Seventh Word ' + seventhWord);
// }

//Soal nomor 3
// import 'dart:io';

// void main() {
//   // Meminta input untuk nama depan
//   stdout.write('Masukkan nama depan: ');
//   String? firstName = stdin.readLineSync();

//   // Meminta input untuk nama belakang
//   stdout.write('Masukkan nama belakang: ');
//   String? lastName = stdin.readLineSync();

//   // Menggabungkan nama depan dan nama belakang
//   String fullName = '$firstName $lastName';

//   // Output hasil gabungan nama
//   print('Nama lengkap Anda adalah: $fullName');
// }

// stdin.readLineSync() digunakan untuk membaca input dari pengguna.
// stdout.write() digunakan untuk menampilkan pesan tanpa pindah ke baris baru (berbeda dari print() yang langsung pindah ke baris baru).
// Variabel firstName dan lastName menyimpan input dari pengguna, dan kemudian digabungkan dalam variabel fullName.
// Hasilnya adalah nama lengkap yang diinput akan ditampilkan di layar.

// void main() {
//   int a = 5;
//   int b = 10;

//   // Perkalian
//   int hasilPerkalian = a * b;
//   print('$a * $b = $hasilPerkalian');

//   // Penjumlahan
//   int hasilPenjumlahan = a + b;
//   print('$a + $b = $hasilPenjumlahan');

//   // Pengurangan
//   int hasilPengurangan = a - b;
//   print('$a - $b = $hasilPengurangan');

//   // Pembagian
//   double hasilPembagian = a / b;
//   print('$a / $b = $hasilPembagian');
// }

import 'dart:io';

void main(List<String> args) {
  stdout.write('masukkan nama Depan anda = ');
  String? namaDepan = stdin.readLineSync();
  stdout.write('masukkan nama Belakang anda = ');
  String? namaBelakang = stdin.readLineSync();
  String fullname = ('$namaDepan $namaBelakang');

  print('Nama Lengkap Anda Adalah = $fullname');
}
