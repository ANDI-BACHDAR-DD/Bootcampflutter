class Lingkaran {
  late double _ruas;

  // Setter untuk mengubah ruas dengan validasi nilai harus positif
  void setRuas(double value) {
    if (value < 0) {
      _ruas = value * -1; // Jika negatif, jadikan positif
    } else {
      _ruas = value;
    }
  }

  // Getter untuk mengambil nilai ruas
  double getRuas() {
    return _ruas;
  }

  // Method untuk menghitung luas lingkaran
  double hitungLuas() {
    return 3.14 * _ruas * _ruas;
  }
}
