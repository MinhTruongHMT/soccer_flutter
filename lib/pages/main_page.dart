import 'package:flutter/material.dart';
import 'package:soccer_final_aplication/pages/order_page.dart';
import 'package:soccer_final_aplication/shared_preferences.dart';

import 'history_widget.dart';
import 'home_widget.dart';
import 'profile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String? action = Shared.getString('id');
  int _currentIndex = 0;
  final tabs = [const OrderPage(), HistoryWidget(), const ProfileWidget()];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: const Text(
          "Soccer",
          style: TextStyle(color: Colors.black87),
        ),
        //leading:const Icon(Icons.menu),
        actions: [
          IconButton(
            color: Colors.black87,
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Xử lý sự kiện khi nhấn vào icon
            },
          ),
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.white10,
        // fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Colors.white),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileWidget()));
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }
}
