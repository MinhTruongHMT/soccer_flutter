import 'package:flutter/material.dart';
import 'package:soccer_final_aplication/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String? action = Shared.getString('id');
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(action.toString())),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        fixedColor: Colors.black,
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
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
