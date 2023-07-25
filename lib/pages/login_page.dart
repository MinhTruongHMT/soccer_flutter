import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soccer_final_aplication/shared_preferences.dart';
import '../model/khach_hang.dart';
import 'main_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

  void login(String userName, String passWord, BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.98:8080/api/khachhangs/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"userName": userName, "passWord": passWord}),
    );
    if (response.statusCode == 200) {
      KhachHang kh = KhachHang.fromJson(jsonDecode(response.body));
      Shared.setKey("id", kh.id.toString());
      Shared.setKey("name", kh.userName.toString());
      Shared.setKey("image", kh.image.toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      throw Exception("Erorr");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "wellcome back",
              style: TextStyle(fontFamily: 'InstagramFont', fontSize: 40),
            ),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Icons.person_2_outlined),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.verified_user_outlined),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                login(_usernameController.text, _passwordController.text,
                    context);
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
