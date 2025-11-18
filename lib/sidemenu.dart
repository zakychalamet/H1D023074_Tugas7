import 'package:flutter/material.dart';
import 'package:praktikum/routes.dart';
import 'package:praktikum/storage.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  void _logout(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Yakin ingin logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (confirm == true && context.mounted) {
      await Storage.logout();
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.person, size: 48),
                const SizedBox(height: 8),
                FutureBuilder<String?>(
                  future: Storage.getUsername(),
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data ?? 'User',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.task_alt),
            title: const Text('Daftar Tugas'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, Routes.home);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              _logout(context);
            },
          ),
        ],
      ),
    );
  }
}
