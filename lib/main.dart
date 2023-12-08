import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_login/pages/home_page.dart';

void main() async{
  //ใช้ในการเริ่มต้นใช้งาน Firebase ใน Flutter
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
