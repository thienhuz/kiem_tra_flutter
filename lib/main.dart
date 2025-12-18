import 'package:flutter/material.dart';
import 'bai1/bai1.dart' as bai1;
import 'bai2/bai2.dart' as bai2;
import 'bai3/bai3.dart' as bai3;
import 'bai4/bai4.dart' as bai4;
import 'bai5/bai5.dart' as bai5;
import 'bai6/bai6.dart' as bai6;
import 'bai7/bai7.dart' as bai7;
import 'bai8/bai8.dart' as bai8;
import 'bai9/bai9.dart' as bai9;
import 'bai10/bai10.dart' as bai10 ;
import 'bai11/bai11.dart' as bai11;
import 'bai12/bai12.dart' as bai12;
import 'bai13/bai13.dart' as bai13 ;
import 'bai14/bai14.dart' as bai14 ;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignments',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = -1;
  String _title = "Flutter Assignments";
  void _onItemTapped(int index, String title) {
    setState(() {
      _selectedIndex = index;
      _title = title;
    });
    Navigator.pop(context);
  }

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return const bai1.MyHomePage();
      case 1:
        return const bai2.MyHomePage();
      case 2:
        return const bai3.MyHomePage();
      case 3:
        return const bai4.MyHomePage();
      case 4:
        return const bai5.ChangeColorApp();
      case 5:
        return const bai6.CountApp();
      case 6:
        return const bai7.CountTimeApp();
      case 7:
        return const bai8.Login();
      case 8:
        return const bai9.DangKi();
      case 9:
        return const bai10.BMI(); 
      case 10:
        return const bai11.PhanHoi();
      case 11:
        return const bai12.MyProduct();
      case 12:
        return const bai13.MyProduct();
      case 13:
        return const bai14.LoginScreen();
      default:
        return _buildWelcomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), backgroundColor: Colors.blue.shade50),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height:100, 
              child: DrawerHeader(
                margin: EdgeInsets.zero, 
                padding: const EdgeInsets.only(
                  left: 16,
                  bottom: 16,
                ), 
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Nguyễn Hữu Thiện",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Bài tập Flutter",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.place, color: Colors.blue),
              title: const Text('Bài 1 : My Place '),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(0, "Bài 1 : My Place "),
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Bài 2 : Exercise 2 '),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(1, "Bài 2 : Exercise 2 "),
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Bài 3 : My Guide '),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(2, "Bài 3 : My Guide "),
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Bài 4 : Home Page '),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(3, "Bài 4 : Home Page "),
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Bài 5 :Change Color App'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(4, "Bài 5 :Change Color App"),
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Bài 6 : Count App'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(5, "Bài 6 : Count App"),
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Bài 7 :Count Time App'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(6, "Bài 7 :Count Time App"),
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Bài 8 : Login'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(7, "Bài 8 : Login"),
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Bài 9 : Register'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(8, "Bài 9 : Register"),
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Bài 10: BMI '),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(9, "Bài 10 : BMI"),
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Bài 11: Phan hồi '),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(10, "Bài 11 : Phan hồi"),
            ),  
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Bài 12: Product '),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(11, "Bài 12 : Product"),
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Bài 13: New API '),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(12, "Bài 13 : New API"),
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Bài 14: Login API '),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _onItemTapped(13, "Bài 14 : Login API"),
            ),
          ],
        ),
      ),

      body: _getBody(),
    );
  }

  Widget _buildWelcomeScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.menu, size: 80, color: Colors.blue),
          SizedBox(height: 20),
          Text("Open the menu on the left 👈", style: TextStyle(fontSize: 18)),
          Text(
            "Select a lesson to explore",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
