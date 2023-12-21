import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants/assets.dart';
import 'package:shop/cubits/cart_cubit/cart_cubit.dart';
import 'package:shop/widgets/custom_card.dart';
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
      body: BlocProvider.of<CartCubit>(context).cartProducts.isEmpty
          ? Center(
              child: SvgPicture.asset(
              Assets.assetsImagesAddtoCartAmico,
              height: 350,
            ))
          : const CartListView(),
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
