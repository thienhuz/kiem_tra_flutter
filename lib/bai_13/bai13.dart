
import 'package:flutter/material.dart';
import 'package:kiemtraflutter/bai13/api.dart';
import 'package:kiemtraflutter/bai13/detail_screen.dart';
import 'package:kiemtraflutter/bai13/model/product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "DANH SÁCH BÀI VIẾT",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Product>>(
        future: test_api.getAllProduct(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber),
            );
          }

          if (snap.hasError) {
            return Center(child: Text("Lỗi: ${snap.error}"));
          }

          if (snap.hasData && snap.data!.isNotEmpty) {
            return myListProduct(snap.data!);
          } else {
            return const Center(child: Text("Không có bài viết nào."));
          }
        },
      ),
    );
  }

  Widget myListProduct(List<Product> ls) {
    return ListView.builder(
      itemCount: ls.length,
      itemBuilder: (context, index) {
        return myProduct(ls[index], context);
      },
    );
  }

  Widget myProduct(Product p, BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: InkWell(

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen(product: p)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Ảnh Thumbnail
              SizedBox(
                width: 100,
                height: 100,
                child: (p.urlToImage.isNotEmpty)
                    ? Image.network(
                        p.urlToImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey,
                          );
                        },
                      )
                    : const Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.grey,
                      ),
              ),
              const SizedBox(width: 10),

              // Tiêu đề và Mô tả
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Tiêu đề (In đậm)
                    Text(
                      p.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Mô tả ngắn
                    Text(
                      p.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    // Nguồn
                    Text(
                      p.source.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
