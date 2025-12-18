import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController _chieucao = TextEditingController();
  final TextEditingController _cannang = TextEditingController();
  bool show1 = false;
  bool show2 = false;
  double? bmi;
  String? ketQua;
  void changeSumBMI() {
    setState(() {
      show1 = _chieucao.text.isEmpty;
      show2 = _cannang.text.isEmpty;
    });
    double chieucao = double.tryParse(_chieucao.text) ?? 0;
    double cannang = double.tryParse(_cannang.text) ?? 0;
    if (chieucao > 0 && cannang > 0) {
      bmi = cannang / (chieucao * chieucao);

      // Phân loại BMI
      if (bmi! < 18.5) {
        ketQua = "Gầy";
      } else if (bmi! < 24.9) {
        ketQua = "Bình thường";
      } else if (bmi! < 29.9) {
        ketQua = "Thừa cân";
      } else {
        ketQua = "Béo phì";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Tính chỉ số BMI",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: _chieucao,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.height),
                labelText: "Chiều cao(m )",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _cannang,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.monitor),
                labelText: "Cân nặng (kg)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: changeSumBMI,
              icon: const Icon(Icons.app_registration),
              label: const Text("Tính BMI"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            if (show1)
              Text(
                "Vui lòng nhập chiều cao",
                style: TextStyle(color: Colors.red),
              ),
            if (show2)
              Text(
                "Vui lòng nhập cân nặng",
                style: TextStyle(color: Colors.red),
              ),
            if (bmi != null)
              Text(
                "BMI của bạn: ${bmi!.toStringAsFixed(2)}\nKết luận: $ketQua",
                style: const TextStyle(color: Colors.green, fontSize: 18),
              ),

            // if (!show)
            //   const Text(
            //     "Đã nhập cân nặng và chiều cao",
            //     style: TextStyle(color: Colors.red),
            //   ),
          ],
        ),
      ),
    );
  }
}
