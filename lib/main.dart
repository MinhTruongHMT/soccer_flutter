import 'package:flutter/material.dart';
import 'package:soccer_final_aplication/pages/login_page.dart';
import 'package:soccer_final_aplication/shared_preferences.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  runApp(const MyApp() // Wrap your app
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
