

import 'package:movieapp/pages/home_screen.dart';
import 'package:movieapp/pages/login_screen.dart';

import 'routes.dart';

final directions = {
  Routes.login.name: (context) => Login(),
  Routes.home.name: (context) => const HomeScreen(),
};