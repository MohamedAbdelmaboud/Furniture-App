// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop/widgets/show_snack_bar.dart';

Future<UserCredential?> signIn(
    String? email, String? password, BuildContext context) async {
  try {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email!, password: password!);
    showSnackBar(context, 'Login done successfully!', false);
    return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showSnackBar(context, 'No user found for that email.', true);
    } else if (e.code == 'wrong-password') {
      showSnackBar(context, 'Wrong password provided for that user.', true);
    } else if (e.code == 'network-request-failed') {
      showSnackBar(context, 'No Network connection', true);
    }
  }
  return null;
}
