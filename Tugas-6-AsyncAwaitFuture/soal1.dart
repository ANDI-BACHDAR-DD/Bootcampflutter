import 'dart:async'; // Perlu mengimport dart:async untuk fitur Future

class Human {
  String name = "Nama Character One Piece";

  // Ubah fungsi getName menjadi Future
  Future<void> getName() async {
    await Future.delayed(Duration(seconds: 3)); // Delay 3 detik
    name = "Rafi";
    print("get data [done]");
  }
}

void main(List<String> args) async {
  var h = Human();
  print("Luffy");
  print("Zorro");
  print("Killer");

  print(h.name); // Nama default: "Nama Character One Piece"

  await h.getName(); // Menunggu 3 detik hingga data siap

  print("name 3: ${h.name}"); // Nama setelah diperbarui: "Rafi"
}
