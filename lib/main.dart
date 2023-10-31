import 'package:admin_coffee_app/Screens/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/authScreens/sign_up_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBd_gf0rVCojNrv3a6iNwWt-ixTLxMqIkE",
        appId: "1:492084862374:web:5df5f0ce95a87940cec367",
        messagingSenderId: "492084862374",
        projectId: "coffee-app-62323",
    )
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool isLogin = false;

  checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && FirebaseAuth.instance.currentUser!.emailVerified) {
        setState(() {
          isLogin = true;
        });
      }
    });
  }
  @override
  void initState() {
    checkIfLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Coffee App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: isLogin == true ? const HomeScreen() : const SignUpScreen());
  }
}


