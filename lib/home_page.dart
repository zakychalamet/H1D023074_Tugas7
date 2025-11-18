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
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final tasks = await Storage.getTasks();
    if (mounted) {
      setState(() {
        _tasks = tasks;
      });
    }
  }

  Future<void> _addTask() async {
    final result = await Navigator.pushNamed(context, Routes.taskForm);
    if (result == true) {
      _loadTasks();
    }
  }

  Future<void> _editTask(Task task) async {
    final result = await Navigator.pushNamed(
      context,
      Routes.taskForm,
      arguments: task,
    );
    if (result == true) {
      _loadTasks();
    }
  }

  Future<void> _toggleTask(Task task) async {
    await Storage.updateTask(task.copyWith(isCompleted: !task.isCompleted));
    _loadTasks();
  }

  Future<void> _deleteTask(Task task) async {
    await Storage.deleteTask(task.id);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Tugas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addTask,
          ),
        ],
      ),
      drawer: const SideMenu(),
      body: _tasks.isEmpty
          ? const Center(
              child: Text('Belum ada tugas'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: Checkbox(
                      value: task.isCompleted,
                      onChanged: (_) => _toggleTask(task),
                    ),
                    title: Text(
                      task.title,
                      style: TextStyle(
                        decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                        color: task.isCompleted ? Colors.grey : null,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _editTask(task),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteTask(task),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
