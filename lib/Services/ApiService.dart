import 'package:dio/dio.dart';

import '../Models/Product.dart';

class ApiService {
  static var dio = Dio();

  static Future<List<Product>?> fetchProducts() async {
    const url = 'https://fakestoreapi.com/products';
    try {
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var data = response.data as List;
        return data.map((product) => Product.fromJson(product)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
