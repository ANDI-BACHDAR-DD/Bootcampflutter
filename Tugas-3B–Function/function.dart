//Jawaban Nomor 1
// String teriak() {
//   return "Halo Sanbers!";
// }

// void main() {
//   print(teriak());
// }

//Jawaban Nomor 2

// int kalikan(int num1, int num2) {
//   return num1 * num2;
// }

// void main() {
//   var num1 = 12;
//   var num2 = 4;

//   var hasilKali = kalikan(num1, num2);
//   print(hasilKali); // 48
// }

//Jawaban Nomor 3
// String introduce(String name, int age, String address, String hobby) {
//   return 'Nama saya $name, umur saya $age tahun, alamat saya di $address, dan saya punya hobby yaitu $hobby!';
// }

// void main() {
//   var name = "ANDI BACHDAR DD";
//   var age = 22;
//   var address = "jln. MaguwoHarjo Sleman";
//   var hobby = "Coding in Flutter";

//   var perkenalan = introduce(name, age, address, hobby);
//   print(perkenalan);
// }

//Jawaban Nomor 4

// int faktorial(int angka) {
//   if (angka <= 0) {
//     return 1;
//   } else {
//     int hasil = 1;
//     for (int i = angka; i > 0; i--) {
//       hasil *= i;
//     }
//     return hasil;
//   }
// }

// void main() {
//   var angka = 6;
//   var hasilFaktorial = faktorial(angka);
//   print(hasilFaktorial); // 720
// }
// import 'dart:io';

// void main() {
//   print("Masukkan pssword = ");
//   String? inputText = stdin.readLineSync()!;
//   print("Password saya adalah : ${inputText}");
// }
import 'dart:io';

// void main() {
//   print("Masukkan Password = ");
//   String? inputText = stdin.readLineSync()!;
//   print("Password saya adalah : ${inputText}");
// }
// void main() {
//   var name = "Sommeng";
//   var age = 22;
//   var toDayIsFriday = false;

//   print(name);
//   print(age);
//   print(toDayIsFriday);
// }
//

// void main() {
//   var sentence = 'I am going to be Flutter Developer';

//   var Word = sentence.split(' ');

//   var firstWord = Word[0];
//   var secondword = Word[1];
//   var thridword = Word[2];
//   var forthword = Word[3];
//   var fifthword = Word[4];
//   var sixthword = Word[5];
//   var seventhword = Word[6];

//   print('FirstWord:' + firstWord);
//   print('SecondWord:' + secondword);
//   print('ThridWord:' + thridword);
//   print('Forthword:' + forthword);
//   print('fifthWord:' + fifthword);
//   print('SixthWord:' + sixthword);
//   print('SeventhWord:' + seventhword);
// }

// void main() {
//   stdout.write('Masukkan nama depan : ');
//   String? namaDepan = stdin.readLineSync();

//   stdout.write('Masukkan nama tengah : ');
//   String? namaBelakang = stdin.readLineSync();

//   String Fullname = '$namaDepan $namaBelakang';

//   print('Nama lengkap anda adalah : $Fullname ');
// }

// void main() {
//   int a = 10;
//   int b = 15;

//   //perkalian
//   int hasilperkalian = a * b;
//   print('$a * $b = $hasilperkalian ');

//   //prnjumlahan
//   int hasilPenjumlahan = a + b;
//   print('$a + $b = $hasilPenjumlahan');

//   //pengurangan
//   int hasilPengurangan = a - b;
//   print('$a - $b = $hasilPengurangan');

//   //pembagian
//   double hasilPembagian = a / b;
//   print('$a / $b = $hasilPembagian');
// }

void main() {
  stdout.write('Masukkan nama depan anda : ');
  String? namaDepan = stdin.readLineSync();

  stdout.write('Masukkan nama belakang anda : ');
  String? namaBelakang = stdin.readLineSync();

  String fullname = '$namaDepan $namaBelakang';

  print('nama lengkap anda adalah = $fullname ');
}
