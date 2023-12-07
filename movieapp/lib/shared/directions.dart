

import 'package:movieapp/screens/home_screen.dart';
import 'package:movieapp/screens/login_screen.dart';

import 'routes.dart';

final directions = {
  Routes.login.name: (context) => Login(),
  Routes.home.name: (context) => const HomeScreen(),
};