import 'dart:math';
import 'package:flutter/material.dart';

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color color = Colors.black;
  String stringColor = "den";
  // Danh sách 5 màu
  List<String> stringListColor = ['den', 'xanh la', 'do', 'cam', 'xanh bien'];
  List<Color> listColor = [
    Colors.black,
    Colors.green,
    Colors.red,
    Colors.deepOrange,
    Colors.blueAccent,
  ];

  void changeColor() {
    setState(() {
      var random = Random();
      var index = random.nextInt(listColor.length);
      color = listColor[index];
      stringColor = stringListColor[index];
    });
  }

  void resetColor() {
    setState(() {
      color = Colors.black;
      stringColor = "den";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Change Color App",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black45,
      ),
      body: Container(
        color: color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Màu hiện tại",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                stringColor,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: changeColor,
                    child: const Text("Change Color"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: resetColor,
                    child: const Text("Reset Color"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
