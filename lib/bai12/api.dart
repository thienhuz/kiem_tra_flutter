
import 'package:dio/dio.dart';
import 'package:kiemtraflutter/bai12/model/product.dart';

class Api {
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    var response = await dio.request("https://fakestoreapi.com/products");

    List<Product> listProduct = [];

    if (response.statusCode == 200) {
      List data = response.data;

      listProduct = data.map((x) => Product.fromJson(x)).toList();
    } else {
      print("Lỗi kết nối: ${response.statusCode}");
    }

    return listProduct;
  }
}

var test_api = Api();
