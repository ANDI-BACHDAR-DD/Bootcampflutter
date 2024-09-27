import 'lingkaran.dart';

void main(List<String> args) {
  Lingkaran lingkaran = Lingkaran();
  lingkaran.setRuas(-7.0); // Nilai negatif akan diubah menjadi positif
  print("Ruas Lingkaran: ${lingkaran.getRuas()}");
  print("Luas Lingkaran: ${lingkaran.hitungLuas()}");
}
