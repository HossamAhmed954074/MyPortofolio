import 'package:flutter/material.dart';
import 'package:hossam_pr/screens/home_page.dart';

void main() {
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

