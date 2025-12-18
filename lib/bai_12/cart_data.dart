import 'package:kiemtraflutter/bai12/model/product.dart';

// Class này dùng để quản lý giỏ hàng dùng chung cho toàn app
class CartData {
  // Danh sách static để lưu sản phẩm, truy cập được từ mọi nơi
  static List<Product> cartItems = [];

  static void addToCart(Product product) {
    cartItems.add(product);
  }

  static void removeProduct(Product product) {
    cartItems.remove(product);
  }
  
  static double getTotalPrice() {
    double total = 0;
    for (var p in cartItems) {
      // Ép kiểu về double để tính toán tránh lỗi
      total += double.parse(p.price.toString()); 
    }
    return total;
  }
}