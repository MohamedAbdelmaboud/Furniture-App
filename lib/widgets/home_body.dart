import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop/constants/constants.dart';
import 'package:shop/cubits/categories_cubit/categories_cubit.dart';
import 'package:shop/cubits/categories_cubit/categoris_states.dart';
import 'package:shop/cubits/products_cubit/products_cubit.dart';
import 'package:shop/cubits/products_cubit/products_states.dart';
import 'package:shop/widgets/categories_list_view.dart';
import 'package:shop/widgets/custom_text.dart';
import 'package:shop/widgets/products_grid_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          const Row(
            children: [
              CustomText(
                'Browse by category',
                color: kTextColor,
                fontSize: 14,
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          BlocBuilder<CategoriesCubit, CategorirsStates>(
            builder: (context, state) {
              if (state is CategorirsLoadedState) {
                return CategoriesListView(
                    categories:
                        BlocProvider.of<CategoriesCubit>(context).categories!);
              } else {
                return const SpinKitRipple(
                  color: kPrimaryColor,
                  size: 50.0,
                );
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0),
            child: Divider(
              height: 5,
              thickness: 1,
            ),
          ),
          const Row(
            children: [
              CustomText(
                'Recommended for you',
                color: kTextColor,
                fontSize: 14,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<ProductsCubit, ProductsStates>(
            builder: (context, state) {
              if (state is ProductsLoadedState) {
                return ProductsGridView(
                  products:
                      BlocProvider.of<ProductsCubit>(context).productModels!,
                );
              } else {
                return const SpinKitRipple(
                  color: kPrimaryColor,
                  size: 50.0,
                );
              }
            },
          )
        ]),
      ),
    );
  }
}
