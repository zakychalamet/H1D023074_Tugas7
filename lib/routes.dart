import 'package:flutter/material.dart';
import 'package:praktikum/home_page.dart';
import 'package:praktikum/login_page.dart';
import 'package:praktikum/profile_page.dart';
import 'package:praktikum/settings_page.dart';
import 'package:praktikum/help_page.dart';

class Routes {
  static const String login = '/';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String help = '/help';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case home:
        final args = routeSettings.arguments;
        return MaterialPageRoute(
          builder: (_) => HomePage(username: args as String?),
        );
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case help:
        return MaterialPageRoute(builder: (_) => const HelpPage());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}
