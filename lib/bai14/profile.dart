
import 'package:flutter/material.dart';
import 'package:kiemtraflutter/bai14/bai14.dart';
import 'package:kiemtraflutter/bai14/model/user.dart';
import 'package:kiemtraflutter/bai14/services/api.dart';


class ProfileScreen extends StatefulWidget {
  final String token;
  const ProfileScreen({super.key, required this.token});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Api _Api = Api();
  User? user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void _loadProfile() async {
    final userResult = await _Api.getProfile(widget.token);
    if (mounted) {
      setState(() {
        user = userResult;
        _isLoading = false;
      });
    }
  }
  void _handleLogout() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: _handleLogout),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : user == null
          ? const Center(child: Text("Lỗi tải thông tin"))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(user!.image),
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "${user!.firstName} ${user!.lastName}",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          user!.companyTitle,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue[700],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildInfoTile(
                          Icons.cake,
                          "Ngày sinh",
                          user!.birthDate,
                        ), 
                        _buildInfoTile(
                          Icons.person,
                          "Giới tính",
                          user!.gender.toUpperCase(),
                        ), 
                        const Divider(height: 1, indent: 20, endIndent: 20),
                        _buildInfoTile(Icons.email, "Email", user!.email),
                        const Divider(height: 1, indent: 20, endIndent: 20),
                        _buildInfoTile(Icons.phone, "Phone", user!.phone),
                        const Divider(height: 1, indent: 20, endIndent: 20),
                        _buildInfoTile(
                          Icons.business,
                          "Công ty",
                          user!.companyName,
                        ),
                        const Divider(height: 1, indent: 20, endIndent: 20),
                        _buildInfoTile(
                          Icons.location_on,
                          "Địa chỉ",
                          user!.address,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: _handleLogout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[50], 
                        foregroundColor: Colors.red, 
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                      icon: const Icon(Icons.logout),
                      label: const Text(
                        "ĐĂNG XUẤT",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.blue, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}
