import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants/assets.dart';
import 'package:shop/widgets/custom_column.dart';
import 'package:shop/widgets/custom_text.dart';
import 'package:shop/widgets/custom_text_form_field.dart';
import 'package:shop/widgets/my_button.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);
  static String id = 'SignUpView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            SvgPicture.asset(
              Assets.assetsImagesFurniturelogin,
              height: 200,
            ),
            const CustomText(
              'Create an account',
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomColumn(
              prefixIcon: Icons.person_2_outlined,
              text: 'User name',
              hintText: 'Enter your name',
            ),
            const CustomColumn(
              prefixIcon: Icons.email_outlined,
              text: 'Email',
              hintText: 'Enter your Email',
            ),
            const Row(
              children: [
                CustomText(
                  'Password',
                  fontSize: 14,
                ),
              ],
            ),
            CustomTextFromField(
              prefixIcon: Icons.lock_outline,
              hintText: 'Enter your password',
              suffixIcon: Icons.visibility,
            ),
            const Row(
              children: [
                CustomText(
                  'Password',
                  fontSize: 14,
                ),
              ],
            ),
            CustomTextFromField(
              prefixIcon: Icons.lock_outline,
              hintText: 'confirm Password',
              suffixIcon: Icons.visibility,
            ),
            MyButton(text: 'Sign up', onPressed: () {}),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    "Already have an account?",
                    fontSize: 14,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const CustomText(
                        'Log in',
                        fontSize: 14,
                        color: Colors.blue,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
