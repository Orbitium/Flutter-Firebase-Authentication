import 'package:firebase_authentication/auth.dart';
import 'package:firebase_authentication/pages/login_page.dart';
import 'package:firebase_authentication/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  // Be sure all widgets are initialized
  // otherwise, firebase can crash the app
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Start the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Authentication',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // If there's current user, open the main page
      // If there's no current user, open the login page
      home: Auth.currentUser == null ? const LoginPage() : const MainPage(),
    );
  }
}
