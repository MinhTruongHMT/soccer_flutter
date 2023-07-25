import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:soccer_final_aplication/pages/login_page.dart';
import 'package:soccer_final_aplication/pages/main_page.dart';
import 'package:soccer_final_aplication/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  runApp(const MyApp());
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Shared.init();
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => MyApp(), // Wrap your app
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Logi6nPage(),
    );
  }
}
