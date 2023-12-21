import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/constants/assets.dart';
import 'package:shop/constants/constants.dart';
import 'package:shop/cubits/cart_cubit/cart_cubit.dart';
import 'package:shop/cubits/cart_cubit/cart_states.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/views/cart_view.dart';
import 'package:shop/widgets/color_item.dart';
import 'package:shop/widgets/custom_text.dart';
import 'package:shop/widgets/my_button.dart';
import 'package:shop/widgets/show_snack_bar.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key}) : super(key: key);
  static String id = 'DetailsView';

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  int currentIndex = 0;
  List<Color> myColors = [
    const Color(0xFF7BA275),
    const Color(0xFFD7D7D7),
    const Color(0xFF171717),
    const Color(0xFF795548),
    const Color(0xFFFFEB3B),
  ];
  bool def = true;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, CartView.id);
            },
            child: SvgPicture.asset(
              Assets.assetsImagesBag,
              height: 20,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: 190,
                  height: 380,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        productModel.category.toUpperCase(),
                        letterSpacing: 3,
                        color: kTextColor.withOpacity(0.6),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: CustomText(
                          productModel.title,
                          color: kTextColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomText(
                        'From',
                        letterSpacing: 3,
                        color: kTextColor.withOpacity(0.6),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        r'$' '${productModel.price}',
                        color: kTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 5),
                        child: CustomText(
                          'Avalible Colors',
                          color: kTextColor.withOpacity(0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                currentIndex = index;
                                BlocProvider.of<CartCubit>(context)
                                    .colors
                                    .add(myColors[currentIndex]);
                                def = false;
                                setState(() {});
                              },
                              child: ColorItem(
                                color: myColors[index],
                                isActive: currentIndex == index,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 190,
                child: CachedNetworkImage(
                  height: 170,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  imageUrl: productModel.image,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      productModel.subTitle,
                      color: kTextColor,
                      fontSize: 16,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomText(
                      productModel.description,
                      color: kTextColor.withOpacity(0.7),
                      fontSize: 14,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    BlocConsumer<CartCubit, CartStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return MyButton(
                          text: 'Add to Cart',
                          onPressed: () {
                            BlocProvider.of<CartCubit>(context)
                                .add(productModel);
                            def
                                ? BlocProvider.of<CartCubit>(context)
                                    .colors
                                    .add(myColors[0])
                                : null;
                            showSnackBar(context, 'Added Successfully', false);
                          },
                          isLoading: state is CartLoadingState ? true : false,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
