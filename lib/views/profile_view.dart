import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop/constants/assets.dart';
import 'package:shop/constants/constants.dart';
import 'package:shop/views/cart_view.dart';
import 'package:shop/views/login_view.dart';
import 'package:shop/widgets/custom_text.dart';
import 'package:shop/widgets/custom_text_form_field.dart';
import 'package:shop/widgets/my_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  static String id = 'ProfileView';
  @override
  Widget build(BuildContext context) {
    TextEditingController? controller = TextEditingController(text: myEmail);
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: const BoxDecoration(color: kPrimaryColor),
              ),
              Positioned(
                  bottom: -100,
                  left: MediaQuery.of(context).size.width * 0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: Image.asset(
                      Assets.assetsImagesMe,
                      height: 200,
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 110,
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                Container(decoration: const BoxDecoration(color: Colors.white)),
                const CustomText(
                  'Mohamed abdelmaboud',
                  color: kTextColor,
                  fontSize: 16,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFromField(
                  prefixIcon: Icons.email_outlined,
                  controller: controller,
                  enabled: false,
                  labelText: 'Email',
                ),
                MyButton(
                    text: 'View Card',
                    onPressed: () {
                      Navigator.pushNamed(context, CartView.id);
                    }),
                MyButton(
                    backgroundColor: Colors.red,
                    text: 'Log out',
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      GoogleSignIn googleSignIn = GoogleSignIn();
                      googleSignIn.signOut();
                      Navigator.popAndPushNamed(context, LoginView.id);
                    })
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
