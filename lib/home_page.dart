import 'package:flutter/material.dart';
import 'package:praktikum/routes.dart';
import 'package:praktikum/sidemenu.dart';
import 'package:praktikum/storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.username});

  final String? username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final username = widget.username ?? await Storage.getUsername();
    if (mounted) {
      setState(() {
        _username = username;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, ${_username ?? 'User'}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('Menu Utama:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            _buildMenuCard(
              context,
              icon: Icons.person,
              title: 'Profile',
              route: Routes.profile,
            ),
            _buildMenuCard(
              context,
              icon: Icons.settings,
              title: 'Settings',
              route: Routes.settings,
            ),
            _buildMenuCard(
              context,
              icon: Icons.help,
              title: 'Bantuan',
              route: Routes.help,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, {required IconData icon, required String title, required String route}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
