import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/constants/assets.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, this.isActive = false});
  final Color color;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(7),
        height: 30,
        width: 30,
        margin: const EdgeInsets.only(top: 10, right: 10),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
        child: isActive
            ? SvgPicture.asset(
                Assets.assetsImagesCheck,
                height: 16,
              )
            : null);
  }
}
