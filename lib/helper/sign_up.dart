// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop/widgets/show_snack_bar.dart';

Future<UserCredential?> signUp(
  String? email,
  String? password,
  BuildContext context,
) async {
  try {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email!, password: password!);
    showSnackBar(context, 'email Created successfully!', false);
    return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showSnackBar(context, 'The password provided is too weak.', true);
    } else if (e.code == 'email-already-in-use') {
      showSnackBar(context, 'The account already exists for that email.', true);
    } else if (e.code == 'network-request-failed') {
      showSnackBar(context, 'No Network connection', true);
    }
  } catch (e) {
    print(e);
  }
  return null;
}
