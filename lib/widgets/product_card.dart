import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop/constants/constants.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/views/details_view.dart';
import 'package:shop/widgets/custom_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsView.id,arguments: productModel);
      },
      child: Card(
        elevation: 5,
        color: kSecondaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.vertical(
                top: Radius.circular(10), bottom: Radius.circular(10))),
        child: Column(
          children: [
            CachedNetworkImage(
              placeholder: (context, url) => const SpinKitRipple(
                color: kPrimaryColor,
                size: 50.0,
              ),
              imageUrl: productModel.image,
              height: 150,
            ),
             CustomText(
              productModel.title,
              color: kTextColor,
              fontSize: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: CustomText(
                '${productModel.price}',
                color: kTextColor.withOpacity(0.6),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
