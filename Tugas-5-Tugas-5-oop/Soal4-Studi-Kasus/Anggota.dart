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
