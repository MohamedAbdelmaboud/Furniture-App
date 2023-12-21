import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubits/categories_cubit/categoris_states.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/services/fetch_categories.dart';

class CategoriesCubit extends Cubit<CategorirsStates> {
  CategoriesCubit() : super(CategorirsIntialState());
  List<CategoryModel>? categories;
  fetch() async {
    categories = await CategoriesService().fetchCategories();
    emit(CategorirsLoadedState());
  }
}
