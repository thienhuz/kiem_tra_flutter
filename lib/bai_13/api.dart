
import 'package:dio/dio.dart';
import 'package:kiemtraflutter/bai_13/model/product.dart';

class Api {
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    var response = await dio.request(
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=34709ef262ed49bdabb8eeca0a82ae9c",
    );
    List<Product> listProduct = [];
    if (response.statusCode == 200) {
      // Sửa: Lấy danh sách bài viết từ khóa "articles"
      List data = response.data["articles"];
      listProduct = data.map((x) => Product.fromJson(x)).toList();
    } else {
      print("Loi roi");
    }
    return listProduct;
  }
}

var test_api = Api();
