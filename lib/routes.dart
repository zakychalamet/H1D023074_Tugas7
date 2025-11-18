import 'package:flutter/material.dart';
import 'package:praktikum/home_page.dart';
import 'package:praktikum/login_page.dart';
import 'package:praktikum/task_form_page.dart';
import 'package:praktikum/storage.dart';

class Routes {
  static const String login = '/';
  static const String home = '/home';
  static const String taskForm = '/task-form';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case home:
        final args = routeSettings.arguments;
        return MaterialPageRoute(
          builder: (_) => HomePage(username: args as String?),
        );
      case taskForm:
        final args = routeSettings.arguments;
        return MaterialPageRoute(
          builder: (_) => TaskFormPage(task: args as Task?),
        );
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}
