import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            block1(),

            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Oeschinen Lake Campground",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Kandersteg, Switzerland",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.red),
                      SizedBox(width: 4),
                      Text("41"),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Column(
                    children: [
                      Icon(Icons.call, color: Colors.blue),
                      SizedBox(height: 5),
                      Text("CALL"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.route, color: Colors.blue),
                      SizedBox(height: 5),
                      Text("ROUTE"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.share, color: Colors.blue),
                      SizedBox(height: 5),
                      Text("SHARE"),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget block1() {
    const src =
        "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg";

    return Center(child: SizedBox(width: 300, child: Image.network(src)));
  }
}
