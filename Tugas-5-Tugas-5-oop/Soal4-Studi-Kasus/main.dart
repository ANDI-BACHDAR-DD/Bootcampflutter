import 'Buku.dart';
import 'Anggota.dart';
import 'Petugas.dart';
import 'Peminjaman.dart';

void main() {
  // Membuat objek buku
  Buku buku1 = Buku("Pemrograman Dart", "John Doe", "9876543210", 3);

  // Membuat objek anggota
  Anggota anggota1 = Anggota("Jane Smith", "A@@2", "Jl. Sudirman No. 2");

  // Membuat objek petugas
  Petugas petugas1 = Petugas("Admin", "P0R1");

  // Petugas login
  petugas1.login('password123');

  // Menambah buku
  petugas1.kelolaBuku(buku: buku1, aksi: 'tambah', jumlah: 3);

  // Menghapus buku
  petugas1.kelolaBuku(buku: buku1, aksi: 'hapus', jumlah: 2);

  // Mengedit buku
  Buku editBuku =
      Buku("Pemrograman Baru", "Joko Tingkir", "078-602-8519-93", 2);
  petugas1.kelolaBuku(buku: buku1, aksi: 'edit', editBuku: editBuku);

  // Membuat objek peminjaman
  Peminjaman peminjaman1 = Peminjaman(buku1, anggota1, DateTime.now());

  // Pinjam buku
  peminjaman1.pinjamBuku();

  // Lihat riwayat peminjaman
  peminjaman1.lihatRiwayat();

  // Kembalikan buku
  peminjaman1.kembalikanBuku();

  // Lihat riwayat peminjaman setelah pengembalian
  peminjaman1.lihatRiwayat();
}
