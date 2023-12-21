import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants/assets.dart';
import 'package:shop/constants/constants.dart';
import 'package:shop/cubits/categories_cubit/categories_cubit.dart';
import 'package:shop/cubits/products_cubit/products_cubit.dart';
import 'package:shop/cubits/products_cubit/products_states.dart';
import 'package:shop/views/profile_view.dart';
import 'package:shop/widgets/custom_text.dart';
import 'package:shop/widgets/home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).fetch();
    BlocProvider.of<CategoriesCubit>(context).fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText('Furniture Store'),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ProfileView.id);
            },
            child: SvgPicture.asset(
              Assets.assetsImagesUser,
              height: 30,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
        leading: const Icon(
          Icons.menu_rounded,
          color: kTextColor,
        ),
      ),
      body: BlocBuilder<ProductsCubit, ProductsStates>(
        builder: (context, state) {
          if (state is ProductsLoadedState) {
            return const HomeBody();
          } else {
            return const SpinKitRipple(
              color: kPrimaryColor,
              size: 50.0,
            );
          }
        },
      ),
    );
  }
}
