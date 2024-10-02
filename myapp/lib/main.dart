import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  counter--; // Mengurangi nilai counter
                });
              },
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 20), // Jarak antar icon dan teks
            Text('Nilai Counter: $counter'),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                setState(() {
                  counter++; // Menambah nilai counter
                });
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}


//penjelasan lebih detail mengenai setstate pada statefullwidget:
//Metode setState() sangat penting dalam Flutter, terutama saat bekerja dengan StatefulWidget, untuk memberi tahu framework bahwa ada perubahan pada state internal widget. Berikut adalah rincian cara kerjanya:

// Apa Fungsi setState:
// setState() digunakan untuk memberitahukan framework Flutter bahwa ada bagian dari state yang berubah. Dalam kasus ini, variabel counter merupakan state internal yang akan bertambah atau berkurang saat pengguna menekan ikon tertentu. Ketika kita memanggil setState(), Flutter akan secara otomatis membangun ulang (rebuild) UI yang bergantung pada state yang berubah.

// Mengapa setState Digunakan di Sini: Dalam kode ini, setState() dipanggil ketika pengguna berinteraksi dengan ikon (Icons.remove atau Icons.add). Saat pengguna menekan salah satu ikon tersebut, nilai variabel counter akan berubah. Agar perubahan ini terlihat di UI, kita perlu memanggil setState(). Tanpa memanggil setState(), UI tidak akan memperbarui tampilan, meskipun nilai counter telah berubah.

// Kapan setState Dipanggil: Dalam kode yang kamu berikan, setState() dipanggil di dalam metode onTap dari InkWell (baris 36 dan 46). Artinya, setiap kali pengguna menekan tombol "decrement" atau "increment", setState() akan dipanggil, dan Flutter akan membangun ulang (rebuild) bagian UI yang relevan untuk memperbarui tampilan teks yang menunjukkan nilai counter.
//adapun poin point yang harus di perhatikan dalam menggunakan set setate
//Poin-Poin Penting dari setState():
// Memicu pembaruan UI: setState() memberi tahu Flutter bahwa ada bagian state yang berubah, sehingga widget tree perlu dibangun ulang.
// Optimasi pembaruan UI: Hanya widget yang bergantung pada state yang berubah yang akan dibangun ulang, bukan keseluruhan widget tree.
// Mengelola perubahan state lokal: setState() digunakan dalam StatefulWidget untuk mengelola dan memperbarui state lokal, seperti pada contoh counter ini.