import 'package:dotted_line/dotted_line.dart';
import 'package:finalproject_mototbike/common/info.dart';
import 'package:finalproject_mototbike/sources/auth_source.dart';
import 'package:finalproject_mototbike/widgets/button_primary.dart';
import 'package:finalproject_mototbike/widgets/button_secondary.dart';
import 'package:finalproject_mototbike/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SinginPage extends StatefulWidget {
  const SinginPage({super.key});

  @override
  State<SinginPage> createState() => _SinginPageState();
}

class _SinginPageState extends State<SinginPage> {
  final edtEmail = TextEditingController();
  final edtPassword = TextEditingController();
  singInpage() {
    if (edtEmail.text == '') return Info.eror('Email must be filled');
    if (edtPassword.text == '') return Info.eror('Password must be filled');

    Info.netral('Loading ..');
    AuthSource.singIn(edtEmail.text, edtPassword.text).then((message) {
      if (message != 'success') {
        return Info.eror(message);
      }
      //success
      Info.success('Success Sign in');
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pushReplacementNamed(context, '/discover');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        children: [
          const Gap(100),
          Image.asset('assets/logo_text.png', height: 38, width: 171),
          const Gap(75),
          const Text(
            'Sign In Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff070623),
            ),
          ),
          const Gap(30),
          const Text(
            'Email Address',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff070623),
            ),
          ),
          const Gap(12),
          Input(
              icon: 'assets/ic_email.png',
              hint: 'Write your real email',
              editingController: edtEmail),
          const Gap(20),
          const Text(
            'Password',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff070623),
            ),
          ),
          const Gap(12),
          Input(
              icon: 'assets/ic_key.png',
              hint: 'Write your real Password',
              editingController: edtPassword,
              obsecure: true),
          const Gap(30),
          ButtonPrimary(text: 'Sing In', onTap: singInpage),
          const Gap(30),
          const DottedLine(
            dashLength: 6,
            dashGapLength: 6,
            dashColor: Color(0xffCECED5),
          ),
          const Gap(30),
          ButtonSecondary(
              text: 'Create New Account',
              onTap: () {
                Navigator.pushReplacementNamed(context, '/singup');
              }),
          const Gap(30),
        ],
      ),
    );
  }
}
