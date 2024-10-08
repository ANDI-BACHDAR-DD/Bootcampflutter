// import 'package:flutter/material.dart';
// import 'package:tugas_11_rest_api/page/login_page.dart';
// //import 'package:google_fonts/google_fonts.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   // Variables to control the visibility of password
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;

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
//                     'assets/image/image_Singup.png', // Replace with your own image asset path
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
//                   const SizedBox(height: 20),
//                   // Confirm Password TextField with visibility toggle
//                   TextField(
//                     obscureText: _obscureConfirmPassword,
//                     decoration: InputDecoration(
//                       labelText: 'Konfirmasi Password',
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscureConfirmPassword
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _obscureConfirmPassword = !_obscureConfirmPassword;
//                           });
//                         },
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(double.infinity, 50),
//                       backgroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text('Mendaftar'),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     //mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: Colors.grey[400],
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(
//                           'Atau daftar menggunakan',
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
//                       const Text('Sudah punya akun?'),
//                       TextButton(
//                         onPressed: () {
//                           // Navigasi ke halaman login
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const LoginScreen(),
//                             ),
//                           ); // Action for login
//                         },
//                         child: const Text(
//                           'masuk',
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
import 'package:tugas_11_rest_api/page/login_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> register() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password dan konfirmasi password tidak cocok"),
      ));
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // Berhasil daftar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pendaftaran berhasil!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mendaftar: ${e.message}')),
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
                const SizedBox(height: 50),
                Image.asset(
                  'assets/image/image_Singup.png',
                  height: 250,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: register,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Mendaftar'),
                ),
                const SizedBox(height: 20),
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
                        'Atau daftar menggunakan',
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
                OutlinedButton.icon(
                  onPressed: () {
                    // Implement Google Sign Up here
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: Image.asset(
                    'assets/icon/icon_Google.png',
                    height: 24,
                  ),
                  label: const Text(
                    'Google',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sudah punya akun?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'masuk',
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
