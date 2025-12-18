import 'package:kiemtraflutter/bai_12/model/product.dart';

class CartData {
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
      total += double.parse(p.price.toString()); 
    }
    return total;
  }
}