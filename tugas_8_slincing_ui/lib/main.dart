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
            Text('Nilai Counter adalah sebaagi berikut : $counter'),
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
