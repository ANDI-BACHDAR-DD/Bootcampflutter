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
