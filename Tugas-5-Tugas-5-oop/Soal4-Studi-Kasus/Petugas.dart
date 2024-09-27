import 'Buku.dart';
import 'Anggota.dart';

class Petugas {
  String nama;
  String idPetugas;

  Petugas(this.nama, this.idPetugas);

  bool login(String password) {
    if (password == 'password123') {
      print('$nama berhasil login.');
      return true;
    } else {
      print('Login gagal: password salah.');
      return false;
    }
  }

  void kelolaBuku(
      {required Buku buku, Buku? editBuku, required String aksi, int? jumlah}) {
    if (aksi == 'tambah') {
      buku.tambahBuku(jumlah ?? 1);
    } else if (aksi == 'hapus') {
      buku.hapusBuku(jumlah ?? 1);
    } else if (aksi == 'edit' && editBuku != null) {
      buku.editBuku(
          judulBaru: editBuku.judul,
          pengarangBaru: editBuku.pengarang,
          isbnBaru: editBuku.isbn);
    } else {
      print('Aksi tidak valid atau parameter editBuku tidak diberikan.');
    }
  }

  void kelolaAnggota(Anggota anggota, String aksi,
      {String? nama, String? alamat}) {
    if (aksi == 'daftar') {
      anggota.daftarAnggota();
    } else if (aksi == 'hapus') {
      anggota.hapusAnggota();
    } else if (aksi == 'edit') {
      // Menggunakan named arguments sesuai dengan method editAnggota
      anggota.editAnggota(
          namaBaru: nama ?? anggota.nama, alamatBaru: alamat ?? anggota.alamat);
    } else {
      print('Aksi tidak valid.');
    }
  }

  void tampilkanInfo() {
    print('Nama Petugas: $nama, ID Petugas: $idPetugas');
  }
}
