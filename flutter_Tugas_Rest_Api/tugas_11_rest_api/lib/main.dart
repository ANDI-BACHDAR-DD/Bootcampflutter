import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tugas_11_rest_api/firebase_options.dart';
import 'package:tugas_11_rest_api/page/login_page.dart';
//import 'firebase_options.dart';
//import 'package:tugas_11_rest_api/page/register_page.dart';
//import 'package:tugas_11_rest_api/user/page/user_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'register page dan login page',
        home: const LoginScreen());
  }
}

// import 'package:flutter/material.dart';
// //import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: RegisterScreen(),
//       ),
//     );
//   }
// }

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
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 50), // Space for status bar
//               Image.asset(
//                 'assets/image/image_Singup.png', // Replace with your own image asset path
//                 height: 250,
//                 fit: BoxFit.contain,
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Password TextField with visibility toggle
//               TextField(
//                 obscureText: _obscurePassword,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Confirm Password TextField with visibility toggle
//               TextField(
//                 obscureText: _obscureConfirmPassword,
//                 decoration: InputDecoration(
//                   labelText: 'Konfirmasi Password',
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscureConfirmPassword
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscureConfirmPassword = !_obscureConfirmPassword;
//                       });
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: const Text('Mendaftar'),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Divider(
//                       color: Colors.grey[400],
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Text(
//                       'Atau daftar menggunakan',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                   Expanded(
//                     child: Divider(
//                       color: Colors.grey[400],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               OutlinedButton.icon(
//                 onPressed: () {},
//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Colors.red),
//                   minimumSize: const Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 icon: Image.asset(
//                   'assets/icon/icon_Google.png', // Replace with your own image asset path
//                   height: 24,
//                 ),
//                 label: const Text(
//                   'Google',
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text('Sudah punya akun?'),
//                   TextButton(
//                     onPressed: () {
//                       // Action for login
//                     },
//                     child: const Text(
//                       'masuk',
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
