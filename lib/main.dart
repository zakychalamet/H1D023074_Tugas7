import 'package:flutter/material.dart';
import 'package:praktikum/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
