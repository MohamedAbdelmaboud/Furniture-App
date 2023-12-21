import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/helper/sign_in.dart';
import 'package:shop/views/home_view.dart';
import 'package:shop/views/signUp_view.dart';
import 'package:shop/widgets/custom_column.dart';
import 'package:shop/widgets/my_button.dart';

import '../constants/assets.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;
  String? password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22),
        child: Form(
          key: formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
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
                  CustomColumn(
                    validator: (value) {
                      if (value!.isEmpty) return 'This field is required';
                      return null;
                    },
                    onChanged: (value) {
                      email = value;
                    },
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
                    validator: (value) {
                      if (value!.isEmpty) return 'This field is required';
                      return null;
                    },
                    onChanged: (value) {
                      password = value;
                    },
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
                  MyButton(
                      text: 'Login',
                      isLoading: isLoading,
                      onPressed: () async {
                        {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            formKey.currentState!.save();
                            await signIn(email, password, context);
                            setState(() {
                              isLoading = false;
                            });
                            // if (!context.mounted) return;
                            // Navigator.pushReplacementNamed(
                            //     context, HomeView.id);
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        }
                      }),
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
          ),
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
