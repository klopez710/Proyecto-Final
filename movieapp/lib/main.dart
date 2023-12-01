import 'package:flutter/material.dart';
import 'package:movieapp/colors.dart';
import 'package:movieapp/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto Final',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colores.fondo,
      ),
      home: const HomeScreen(),
    );
  }
}
