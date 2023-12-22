// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants/assets.dart';
import 'package:shop/helper/sign_up.dart';
import 'package:shop/views/login_view.dart';
import 'package:shop/widgets/custom_column.dart';
import 'package:shop/widgets/custom_text.dart';
import 'package:shop/widgets/custom_text_form_field.dart';
import 'package:shop/widgets/my_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);
  static String id = 'SignUpView';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? email;
  String? password;
  String? confirmPassword;
  String? userName;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  CustomColumn(
                    validator: (value) {
                      if (value!.isEmpty) return 'This field is required';
                      return null;
                    },
                    onChanged: (userName) {},
                    prefixIcon: Icons.person_2_outlined,
                    text: 'User name',
                    hintText: 'Enter your name',
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
                      if (value!.isEmpty) {
                        return 'This field is required';
                      } else if (value != password) {
                        return 'Passwords do not match.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      confirmPassword = value;
                    },
                    prefixIcon: Icons.lock_outline,
                    hintText: 'confirm Password',
                    suffixIcon: Icons.visibility,
                  ),
                  MyButton(
                      isLoading: isLoading,
                      text: 'Sign up',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          await signUp(email, password, context);
                          setState(() {
                            isLoading = false;
                          });
                        //  Navigator.pushNamed(context, LoginView.id);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      }),
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
          ),
        ),
      ),
    );
  }
}
