import 'package:flutter/material.dart';

class PhanHoi extends StatefulWidget {
  const PhanHoi({super.key});

  @override
  State<PhanHoi> createState() => _PhanHoiState();
}

class _PhanHoiState extends State<PhanHoi> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _content = TextEditingController();
  // Dropdown chọn số sao
  String _selectedStar = "4 sao";
  final List<String> _stars = ["1 sao", "2 sao", "3 sao", "4 sao", "5 sao"];

  // Hàm hiện popup phản hồi
  void showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            "Phản hồi của bạn",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Người gửi: ${_name.text}"),
              Text("Số sao: $_selectedStar"),
              Text("Nội dung: ${_content.text}"),
            ],
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Đóng", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gửi phản hồi"),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Họ và tên
            TextField(
              controller: _name,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: "Họ và tên người gửi",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Dropdown số sao
            DropdownButtonFormField(
              value: _selectedStar,
              items: _stars
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedStar = value!;
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.star),
                labelText: "Chọn số sao",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Nội dung phản hồi
            TextField(
              controller: _content,
              maxLines: 3,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.feedback),
                labelText: "Nội dung phản hồi",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Nút gửi
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: showResultDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Phản hồi",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
