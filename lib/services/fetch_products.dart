import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shop/models/product_model.dart';

class ProductsService {
  final Dio dio = Dio();
  String apiUrl = 'https://5f210aa9daa42f001666535e.mockapi.io/api/products';
  fetchProducts() async {
    try {
      Response response = await dio.get(apiUrl);
      List jsonData = response.data;
      List<ProductModel> products = List.generate(
          jsonData.length, (index) => ProductModel.fromJson(jsonData[index]));
      log('jsonData');
      print(jsonData);
      return products;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
