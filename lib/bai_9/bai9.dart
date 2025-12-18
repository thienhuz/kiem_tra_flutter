import 'package:flutter/material.dart';

class DangKi extends StatefulWidget {
  const DangKi({super.key});

  @override
  State<DangKi> createState() => _DangKiState();
}

class _DangKiState extends State<DangKi> {
  bool _isPasswordHidden = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  bool _showNameError = false;
  bool _showEmailError = false;
  bool _showPasswordError = false;
  bool _showConfirmPassError = false;

  void onRegister() {
    setState(() {
    
      _showNameError = _nameController.text.isEmpty;
      _showEmailError = _emailController.text.isEmpty;
      _showPasswordError = _passwordController.text.isEmpty;
      _showConfirmPassError = _confirmPassController.text.isEmpty;
    });

    
    if (!_showNameError &&
        !_showEmailError &&
        !_showPasswordError &&
        !_showConfirmPassError) {
   
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Đăng ký thành công!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Form Đăng ký tài khoản",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
   
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
        
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Họ tên",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (_) {
                      setState(() {
                        _showNameError = false; 
                      });
                    },
                  ),

                  if (_showNameError)
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Vui lòng nhập họ tên",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                      ),
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (_) {
                      setState(() {
                        _showEmailError = false;
                      });
                    },
                  ),
                  if (_showEmailError)
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Vui lòng nhập Email",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _passwordController,
                    obscureText: _isPasswordHidden,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: "Mật khẩu",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                      ),
                    ),
                    onChanged: (_) {
                      setState(() {
                        _showPasswordError = false;
                      });
                    },
                  ),
                  if (_showPasswordError)
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Vui lòng nhập mật khẩu",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _confirmPassController,
                    obscureText: _isPasswordHidden,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: "Xác nhận mật khẩu",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                     
                    ),
                    onChanged: (_) {
                      setState(() {
                        _showConfirmPassError = false;
                      });
                    },
                  ),
                  if (_showConfirmPassError)
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Vui lòng xác nhận mật khẩu",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity, 
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: onRegister,
                  icon: const Icon(Icons.app_registration),
                  label: const Text("Đăng kí", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
