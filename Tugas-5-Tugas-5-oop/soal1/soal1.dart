class Segitiga {
  double alas;
  double tinggi;

  Segitiga(this.alas, this.tinggi);

  double hitungLuas() {
    return 0.5 * alas * tinggi;
  }
}

void main(List<String> args) {
  Segitiga segitiga = Segitiga(20.0, 30.0);
  print("Luas Segitiga: ${segitiga.hitungLuas()}");
}
