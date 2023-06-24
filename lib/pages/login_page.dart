// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            const SizedBox(
              height: 10,
            ),
            Text_Field(
                icon: const Icon(Icons.person_2_outlined), lable: "Username"),
            const SizedBox(
              height: 10,
            ),
            Text_Field(
                icon: const Icon(Icons.verified_user_outlined),
                lable: "Password"),
            const SizedBox(
              height: 20,
            ),
            Container(
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
            )
          ],
        ),
      ),
    );
  }
}

class Text_Field extends StatelessWidget {
  Text_Field({super.key, required this.icon, required this.lable});
  String? lable;
  Icon? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: lable,
          prefixIcon: icon,
          border: const OutlineInputBorder()),
    );
  }
}
