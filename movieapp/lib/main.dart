import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movieapp/colors.dart';
import 'package:movieapp/shared/directions.dart';
import 'package:movieapp/shared/routes.dart';

void main() async {
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto Final',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colores.fondo,
      ),
      initialRoute: (isUserLoggedIn() ? Routes.home.name : Routes.login.name),
      routes: directions,
    );
  }
  bool isUserLoggedIn() {
    final token = box.read('token');
    return token != null && token.isNotEmpty;
  }
}
