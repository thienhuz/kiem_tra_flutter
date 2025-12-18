import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kiemtraflutter/bai14/model/user.dart';

class Api {
  static const String baseUrl = 'https://dummyjson.com';
  Future<String?> login(String username, String password) async {
    try {
      final url = Uri.parse('$baseUrl/auth/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['accessToken']; 
      } else {
        print('Login Error: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }
  Future<User?> getProfile(String token) async {
    try {
      final url = Uri.parse('$baseUrl/auth/me');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return User.fromJson(data);
      } else {
        print('Profile Error: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }
}
