import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hossam_pr/firebase_options.dart';
import 'package:hossam_pr/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Hossam Ahmed Mahmoud',
      home:  HomePage(),
    );
  }
}

