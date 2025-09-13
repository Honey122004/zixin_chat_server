// import 'package:flutter/material.dart';
// import 'splash_screen.dart';
// import 'user_storage.dart'; // Import the UserStorage singleton
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await UserStorage.instance.loadUsers(); // Load users before app starts
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Zixin Chat Server',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const SplashScreen(), // Start with splash screen
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'user_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load users from SharedPreferences before app starts
  await UserStorage.instance.loadUsers();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zixin Chat Server',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(), // Start with splash screen
    );
  }
}
