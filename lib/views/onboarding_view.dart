import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shop/constants/assets.dart';
import 'package:shop/views/login_view.dart';

import '../constants/constants.dart';
import '../widgets/custom_text.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static String id = 'OnboardingView';
  PageDecoration buildPageDecoration() {
    return PageDecoration(
      bodyAlignment: Alignment.center,
      titleTextStyle: GoogleFonts.montserrat(
        color: kTextColor,
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
        titleWidget: SvgPicture.asset(Assets.assetsImagesFurniture),
        body:
            "Transform your living space with our exquisite collection of furniture. Discover pieces that combine style and comfort to create the perfect ambiance for your home.",
      ),
      PageViewModel(
        titleWidget: SvgPicture.asset(Assets.assetsImagesWoodworker),
        decoration: buildPageDecoration(),
        body:
            "Bring your vision to life with our curated selection of furniture. Whether you prefer modern minimalism or classic elegance, find pieces that match your style effortlessly.",
      ),
      PageViewModel(
        decoration: buildPageDecoration(),
        titleWidget: SvgPicture.asset(Assets.assetsImagesQuality),
        body:
            "Experience the highest standards of craftsmanship with our handpicked furniture collection. Each piece is designed to not only enhance your space but also stand the test of time.",
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
          activeColor: kPrimaryColor,
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
      alignment: Alignment.center,
      width: 70,
      height: 35,
      decoration:  BoxDecoration(color: kPrimaryColor,borderRadius: BorderRadius.circular(15)),
      child: CustomText(
        text,
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}
