import 'package:flutter/material.dart';
import 'package:soccer_final_aplication/pages/login_page.dart';

import '../shared_preferences.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final String? id = Shared.getString('id');
  final String? name = Shared.getString('name');
  final String? image = Shared.getString('image');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Image.network(
                  image.toString(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(name!),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage()));
                  },
                  child: Text("LogOut"))
            ],
          ),
        ));
  }
}
