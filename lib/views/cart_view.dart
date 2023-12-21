import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/constants/constants.dart';
import 'package:shop/cubits/cart_cubit/cart_cubit.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/widgets/custom_text.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);
  static String id = 'CartView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText('Cart'),
      ),
      body: CartListView(),
    );
  }
}

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: BlocProvider.of<CartCubit>(context).cartProducts.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return CustomCard(
            color: BlocProvider.of<CartCubit>(context).colors[index],
            productModel:
                BlocProvider.of<CartCubit>(context).cartProducts[index]);
      },
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.productModel,
    required this.color,
  }) : super(key: key);
  final ProductModel productModel;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      elevation: 5,
      color: kSecondaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            productModel.image,
            height: 70,
          ),
          CustomText(
            productModel.title,
            color: kTextColor,
            fontSize: 12,
          ),
          CustomText(
            r'$' '${productModel.price}',
            color: kTextColor,
            fontSize: 14,
          ),
          CustomText(
            getColorName(color.value),
            color: color,
            fontSize: 14,
          ),
          const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

String getColorName(int color) {
  switch (color) {
    case 0xFF7BA275:
      return 'Green';
    case 0xFFD7D7D7:
      return 'Gray';
    case 0xFF171717:
      return 'Black';
    case 0xFF795548:
      return 'Brown';
    case 0xFFFFEB3B:
      return 'Yellow';
    default:
      return 'Unknown';
  }
}
