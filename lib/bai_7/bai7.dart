import 'package:flutter/material.dart';
import 'dart:async';

class CountTimeApp extends StatefulWidget {
  const CountTimeApp({super.key});

  @override
  State<CountTimeApp> createState() => _CountTimeAppState();
}

class _CountTimeAppState extends State<CountTimeApp> {
  int count = 0;
  Timer? timer;
  final TextEditingController _controller = TextEditingController();

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    String minuteStr = minutes.toString().padLeft(2, '0');
    String secondStr = secs.toString().padLeft(2, '0');
    return "$minuteStr:$secondStr";
  }

  void changeStart() {
    if (_controller.text.isEmpty) return;
    int seconds = int.tryParse(_controller.text) ?? 0;
    setState(() {
      count = seconds;
    });

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (count > 0) {
        setState(() {
          count--;
        });
      } else {
        t.cancel();
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("⏰ Hết thời gian!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    });
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      count = 0;
      _controller.clear();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "🕓 Bộ đếm thời gian",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Nhập số giây cần đếm:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Nhập số giây...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              formatTime(count),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: changeStart,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Bắt đầu"),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: resetTimer,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
