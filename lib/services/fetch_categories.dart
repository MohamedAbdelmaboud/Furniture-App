import 'package:dio/dio.dart';
import 'package:shop/models/category_model.dart';

class CategoriesService {
  final Dio dio = Dio();
  String apiUrl = 'https://5f210aa9daa42f001666535e.mockapi.io/api/categories';
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      Response response = await dio.get(apiUrl);
      List jsonData = response.data;
      List<CategoryModel> categories = List.generate(
          jsonData.length, (index) => CategoryModel.fromJson(jsonData[index]));
      print(jsonData);
      return categories;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
