class Buku {
  String judul;
  String pengarang;
  String isbn;
  int jumlah;

  Buku(this.judul, this.pengarang, this.isbn, this.jumlah);

  void tambahBuku(int jumlahTambah) {
    jumlah += jumlahTambah;
    print('$judul berhasil ditambahkan. Jumlah sekarang: $jumlah');
  }

  void hapusBuku(int jumlahHapus) {
    jumlah -= jumlahHapus;
    print('$judul berhasil dihapus. Jumlah sekarang: $jumlah');
  }

  void editBuku(
      {required String judulBaru,
      required String pengarangBaru,
      required String isbnBaru}) {
    judul = judulBaru;
    pengarang = pengarangBaru;
    isbn = isbnBaru;
    print('Info buku berhasil diperbarui.');
  }

  void tampilkanInfo() {
    print('Judul: $judul, Pengarang: $pengarang, ISBN: $isbn, Jumlah: $jumlah');
  }
}

class Anggota {
  String nama;
  String idAnggota;
  String alamat;

  Anggota(this.nama, this.idAnggota, this.alamat);

  void daftarAnggota() {
    print('$nama berhasil didaftarkan.');
  }

  void hapusAnggota() {
    print('$nama berhasil dihapus.');
  }

  void editAnggota({required String namaBaru, required String alamatBaru}) {
    nama = namaBaru;
    alamat = alamatBaru;
    print('Info anggota berhasil diperbarui.');
  }

  void tampilkanInfo() {
    print('Nama: $nama, ID Anggota: $idAnggota, Alamat: $alamat');
  }
}

class Peminjaman {
  Buku buku;
  Anggota anggota;
  DateTime tanggalPinjam;
  DateTime? tanggalKembali;

  Peminjaman(this.buku, this.anggota, this.tanggalPinjam,
      [this.tanggalKembali]);

  void pinjamBuku() {
    print(
        '${anggota.nama} meminjam buku "${buku.judul}" pada tanggal $tanggalPinjam.');
  }

  void kembalikanBuku() {
    tanggalKembali = DateTime.now();
    print(
        '${anggota.nama} mengembalikan buku "${buku.judul}" pada tanggal $tanggalKembali.');
  }

  void lihatRiwayat() {
    print(
        'Riwayat Peminjaman: ${anggota.nama} meminjam "${buku.judul}" pada $tanggalPinjam');
    if (tanggalKembali != null) {
      print(' dan mengembalikan pada $tanggalKembali.');
    }
  }
}

class Titan {
  late double _powerPoint;

  // Setter untuk mengatur nilai power point
  void setPowerPoint(double value) {
    _powerPoint = value < 5 ? 5 : value; // Minimal nilai powerPoint adalah 5
  }

  // Getter untuk mengambil nilai power point
  double getPowerPoint() {
    return _powerPoint;
  }
}
