import 'package:flutter/material.dart';
import 'package:kiosk_app/feature/auth/screen/splash_screen.dart';
import 'package:kiosk_app/feature/auth/screen/login_screen.dart';
import 'package:kiosk_app/feature/auth/screen/register_screen.dart';
// import 'package:kiosk_app/feature/home/screen/home_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    // splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
     register: (context) => const RegisterScreen(),
    // home: (context) => const HomeScreen(),
  };
}
