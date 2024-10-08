// import 'package:flutter/material.dart';
// import 'package:tugas_11_rest_api/page/register_page.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool _obscurePassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 50), // Space for status bar
//                   Image.asset(
//                     'assets/image/image_Login.png', // Replace with your own image asset path
//                     height: 250,
//                     fit: BoxFit.contain,
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Password TextField with visibility toggle
//                   TextField(
//                     obscureText: _obscurePassword,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscurePassword
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _obscurePassword = !_obscurePassword;
//                           });
//                         },
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   // Lupa password text
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                       onPressed: () {
//                         // Action for forgot password
//                       },
//                       child: const Text(
//                         'Lupa password?',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Masuk button
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(double.infinity, 50),
//                       backgroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text('Masuk'),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: Colors.grey[400],
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(
//                           'Atau masuk menggunakan',
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ),
//                       Expanded(
//                         child: Divider(
//                           color: Colors.grey[400],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   // Google button
//                   OutlinedButton.icon(
//                     onPressed: () {},
//                     style: OutlinedButton.styleFrom(
//                       side: const BorderSide(color: Colors.red),
//                       minimumSize: const Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     icon: Image.asset(
//                       'assets/icon/icon_Google.png', // Replace with your own image asset path
//                       height: 24,
//                     ),
//                     label: const Text(
//                       'Google',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('Belum punya akun?'),
//                       TextButton(
//                         onPressed: () {
//                           // Navigasi ke halaman register
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const RegisterScreen(),
//                             ),
//                           ); // Action for sign up
//                         },
//                         child: const Text(
//                           'Mendaftar sekarang',
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_11_rest_api/page/register_page.dart'; // Pastikan path ini benar

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Variabel untuk mengontrol visibilitas password
  bool _obscurePassword = true;

  // Controller untuk email dan password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi untuk login menggunakan email dan password
  Future<void> login() async {
    try {
      // Melakukan login dengan email dan password menggunakan Firebase Auth
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Jika login berhasil, tampilkan pesan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login berhasil!')),
      );

      // Navigasi ke halaman berikutnya (bisa beranda atau halaman utama)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const RegisterScreen()), // Ganti dengan halaman utama/beranda
      );
    } on FirebaseAuthException catch (e) {
      // Tangani error jika login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal login: ${e.message}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50), // Space for status bar
                Image.asset(
                  'assets/image/image_Login.png', // Ganti dengan path gambar yang sesuai
                  height: 250,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),

                // TextField untuk Email
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // TextField untuk Password dengan visibilitas
                TextField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Lupa password (optional)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Bisa menambahkan logika untuk lupa password (forgot password)
                    },
                    child: const Text(
                      'Lupa password?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Tombol login
                ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Masuk'),
                ),
                const SizedBox(height: 20),

                // Divider untuk "Atau masuk menggunakan"
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Atau masuk menggunakan',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Tombol login dengan Google (opsional)
                OutlinedButton.icon(
                  onPressed: () {
                    // Implementasi login dengan Google (jika perlu)
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: Image.asset(
                    'assets/icon/icon_Google.png', // Ganti dengan path ikon Google yang sesuai
                    height: 24,
                  ),
                  label: const Text(
                    'Google',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 20),

                // Navigasi ke halaman register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Belum punya akun?'),
                    TextButton(
                      onPressed: () {
                        // Navigasi ke halaman register
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Mendaftar sekarang',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
