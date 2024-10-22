import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_session/d_session.dart';
import 'package:finalproject_mototbike/models/account.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthSource {
  static Future<String> singUp(
    String name,
    String email,
    String password,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Account account = Account(
        uid: credential.user!.uid,
        name: name,
        email: email,
      );
      await FirebaseFirestore.instance
          .collection('User')
          .doc(account.uid)
          .set(account.toJson());
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return ('The account already exists for that email.');
      }
      log(e.toString());
      return "someting wrong";
    } catch (e) {
      log(e.toString());
      return "someting weong";
    }
  }

  static Future<String> singIn(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final acoountDoc = await FirebaseFirestore.instance
          .collection('User')
          .doc(credential.user!.uid)
          .get();
      await DSession.setUser(Map.from(acoountDoc.data()!));
      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      log(e.toString());
      return "someting wrong";
    } catch (e) {
      log(e.toString());
      return "something wrong: ${e.toString()}"; // Menampilkan pesan error lebih detail
    }
  }
}
