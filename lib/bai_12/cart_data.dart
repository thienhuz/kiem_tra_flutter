import 'package:kiemtraflutter/bai_12/model/product.dart';

class CartData {
  // Biến lưu trữ danh sách giỏ hàng
  static List<Product> cartItems = [];

  static void addToCart(Product product) {
    cartItems.add(product);
    // In ra console để kiểm tra
    print("Đã thêm: ${product.title}. Tổng số lượng: ${cartItems.length}");
  }

  static void removeProduct(Product product) {
    cartItems.remove(product);
  }
  
  static double getTotalPrice() {
    double total = 0;
    for (var p in cartItems) {
      // Ép kiểu an toàn để tránh lỗi nếu giá là int hoặc double
      total += double.parse(p.price.toString()); 
    }
    return total;
  }
}