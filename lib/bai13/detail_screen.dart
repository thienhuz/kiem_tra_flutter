
import 'package:flutter/material.dart';
import 'package:kiemtraflutter/bai13/model/product.dart';
import 'package:kiemtraflutter/bai13/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CHI TIẾT BÀI VIẾT"),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            if (product.urlToImage.isNotEmpty)
              Image.network(
                product.urlToImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(), // Ẩn nếu ảnh lỗi
              )
            else
              const Icon(
                Icons.image_not_supported,
                size: 100,
                color: Colors.grey,
              ),

            const SizedBox(height: 16),

    
            Text(
              product.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${product.source.name} | Tác giả: ${product.author.isEmpty ? "Không rõ" : product.author}",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            Text(product.content, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  if (product.url.isNotEmpty) {
                    launchInBrowser(product.url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Không có liên kết bài viết gốc."),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.open_in_browser),
                label: const Text("Đọc bài viết gốc"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
