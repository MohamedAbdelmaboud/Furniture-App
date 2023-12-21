import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/widgets/custom_text.dart';

import '../constants/constants.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryCard({
    super.key, required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    const spinkit = Center(
      child: SpinKitRipple(
        color: kPrimaryColor,
        size: 50.0,
      ),
    );
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 150,
          height: 170,
          child: Card(
            elevation: 5,
            color: kSecondaryColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.vertical(
                    top: Radius.circular(20), bottom: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  categoryModel.title,
                  color: kTextColor,
                  fontSize: 14,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CustomText(
                    '+${categoryModel.numOfProducts} products',//+100 products
                    color: kTextColor.withOpacity(0.6),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -40.0,
          right: -12,
          child: CachedNetworkImage(
            placeholder: (context, url) => spinkit,
            imageUrl: categoryModel.imagePath,
            height: 150,
          ),
        ),
      ],
    );
  }
}
