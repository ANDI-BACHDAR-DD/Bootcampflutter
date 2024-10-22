import 'package:dotted_line/dotted_line.dart';
import 'package:finalproject_mototbike/common/info.dart';
import 'package:finalproject_mototbike/sources/auth_source.dart';
import 'package:finalproject_mototbike/widgets/button_primary.dart';
import 'package:finalproject_mototbike/widgets/button_secondary.dart';
import 'package:finalproject_mototbike/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final edtName = TextEditingController();
  final edtEmail = TextEditingController();
  final edtPassword = TextEditingController();
  createNewAcount() {
    if (edtName.text == '') return Info.eror('Name must be filled');
    if (edtEmail.text == '') return Info.eror('Email must be filled');
    if (edtPassword.text == '') return Info.eror('Password must be filled');

    Info.netral('Loading ..');
    AuthSource.singUp(edtName.text, edtEmail.text, edtPassword.text)
        .then((massage) {
      if (massage != 'success') return Info.eror(massage);
      //success
      Info.success('Succes Sing Up ');
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pushReplacementNamed(context, '/singin');
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
            'Sign Up Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff070623),
            ),
          ),
          const Gap(30),
          const Text(
            'Complete Name',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff070623),
            ),
          ),
          const Gap(12),
          Input(
              icon: 'assets/ic_profile.png',
              hint: 'Write your real name',
              editingController: edtName),
          const Gap(20),
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
          ButtonPrimary(text: 'Create New Account', onTap: createNewAcount),
          const Gap(30),
          const DottedLine(
            dashLength: 6,
            dashGapLength: 6,
            dashColor: Color(0xffCECED5),
          ),
          const Gap(30),
          ButtonSecondary(
              text: 'Sign In',
              onTap: () {
                Navigator.pushReplacementNamed(context, '/singin');
              }),
          const Gap(30),
        ],
      ),
    );
  }
}
