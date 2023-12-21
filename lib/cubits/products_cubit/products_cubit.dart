import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubits/products_cubit/products_states.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/services/fetch_products.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsIntialState());
  List<ProductModel>? productModels;
  fetch() async{
    productModels =await ProductsService().fetchProducts();
    emit(ProductsLoadedState());
  }
}
