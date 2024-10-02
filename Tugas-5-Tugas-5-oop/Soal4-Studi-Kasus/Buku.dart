

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

  void editBuku({required String judulBaru, required String pengarangBaru, required String isbnBaru}) {
    judul = judulBaru;
    pengarang = pengarangBaru;
    isbn = isbnBaru;
    print('Info buku berhasil diperbarui.');
  }

  void tampilkanInfo() {
    print('Judul: $judul, Pengarang: $pengarang, ISBN: $isbn, Jumlah: $jumlah');
  }
}
