import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shop/views/login_view.dart';

import '../constants/constants.dart';
import '../widgets/custom_text.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static String id = 'OnboardingView';
  PageDecoration buildPageDecoration() {
    return PageDecoration(
      titleTextStyle: GoogleFonts.montserrat(
        color: const Color(0xff001640),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyTextStyle: GoogleFonts.montserrat(
        color: const Color(0xff001640),
        fontSize: 14,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages = [
      PageViewModel(
        decoration: buildPageDecoration(),
        image: SvgPicture.asset('assets/images/Sales.svg'),
        title: "Welcome to Marketi",
        body:
            "Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.",
      ),
      PageViewModel(
        decoration: buildPageDecoration(),
        image: SvgPicture.asset('assets/images/Sales.svg'),
        title: "Welcome to Marketi",
        body:
            "Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.",
      ),
      PageViewModel(
        decoration: buildPageDecoration(),
        image: SvgPicture.asset('assets/images/Sales.svg'),
        title: "Welcome to Marketi",
        body:
            "Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.",
      ),
    ];
    return IntroductionScreen(
      pages: pages,
      showDoneButton: true,
      showSkipButton: false,
      showNextButton: true,
      dotsDecorator: const DotsDecorator(
          spacing: EdgeInsets.all(8),
          activeSize: Size.square(15.0),
          activeColor: Color(0xff001640),
          size: Size.square(12),
          color: Color(0xffB2CCFF)),
      next: const OnboardingButton(text: "Next"),
      done: const OnboardingButton(text: "Done"),
      onDone: () => Navigator.pushReplacementNamed(context, LoginView.id),
    );
  }
}

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: kPrimaryColor),
      child: CustomText(text,color: Colors.white,),
    );
  }
}
