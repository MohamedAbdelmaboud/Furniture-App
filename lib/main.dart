import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubits/cart_cubit/cart_cubit.dart';
import 'package:shop/cubits/categories_cubit/categories_cubit.dart';
import 'package:shop/cubits/products_cubit/products_cubit.dart';
import 'package:shop/firebase_options.dart';
import 'package:shop/my_boc_observer.dart';
import 'package:shop/views/cart_view.dart';
import 'package:shop/views/details_view.dart';
import 'package:shop/views/home_view.dart';
import 'package:shop/views/signUp_view.dart';

import 'views/login_view.dart';
import 'views/onboarding_view.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme:
                const AppBarTheme(elevation: 0.0, color: Colors.transparent)),
        debugShowCheckedModeBanner: false,
        initialRoute: HomeView.id,
        routes: {
          DetailsView.id: (context) => const DetailsView(),
          HomeView.id: (context) => const HomeView(),
          SignUpView.id: (context) => const SignUpView(),
          LoginView.id: (context) => const LoginView(),
          OnboardingView.id: (context) => const OnboardingView(),
          CartView.id: (context) => const CartView()
        },
      ),
    );
  }
}
