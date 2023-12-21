import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/views/signUp_view.dart';
import 'package:shop/widgets/custom_column.dart';
import 'package:shop/widgets/my_button.dart';

import '../constants/assets.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static String id = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.assetsImagesFurniturelogin,
              height: 200,
            ),
            const CustomText(
              'Login to continue',
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomColumn(
              prefixIcon: Icons.email_outlined,
              text: 'Email',
              hintText: 'Enter Your Email',
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const CustomText(
                        'Forget password?',
                        fontSize: 14,
                        color: Colors.blue,
                      )),
                ],
              ),
            ),
            MyButton(text: 'Login', onPressed: () {}),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  svgPic(Assets.assetsImagesIcons8Google),
                  const SizedBox(
                    width: 8,
                  ),
                  svgPic(
                    Assets.assetsImagesIcons8Twitterx,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  svgPic(
                    Assets.assetsImagesIcons8Facebook,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  svgPic(
                    Assets.assetsImagesIcons8Github,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  "Don't have an account?",
                  fontSize: 14,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpView.id);
                    },
                    child: const CustomText(
                      'sign up',
                      fontSize: 14,
                      color: Colors.blue,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  SvgPicture svgPic(String path) {
    return SvgPicture.asset(
      path,
      height: 35,
    );
  }
}


