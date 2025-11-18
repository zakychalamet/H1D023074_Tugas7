import 'package:flutter/material.dart';
import 'package:praktikum/sidemenu.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bantuan')),
      drawer: const SideMenu(),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pertanyaan Umum',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Bagaimana cara login?'),
            Text('Gunakan username: admin dan password: 123'),
          ],
        ),
      ),
    );
  }
}
