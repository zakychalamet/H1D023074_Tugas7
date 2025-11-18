import 'package:flutter/material.dart';
import 'package:praktikum/sidemenu.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      drawer: const SideMenu(),
      body: const Center(
        child: Text('Ini adalah halaman Settings'),
      ),
    );
  }
}
