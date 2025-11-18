import 'package:flutter/material.dart';
import 'package:praktikum/storage.dart';

class TaskFormPage extends StatefulWidget {
  const TaskFormPage({super.key, this.task});

  final Task? task;

  @override
  State<TaskFormPage> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _controller.text = widget.task!.title;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Judul tugas harus diisi')),
      );
      return;
    }

    if (widget.task != null) {
      Storage.updateTask(widget.task!.copyWith(title: _controller.text.trim()));
    } else {
      final newTask = Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _controller.text.trim(),
        isCompleted: false,
      );
      Storage.addTask(newTask);
    }

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task != null ? 'Edit Tugas' : 'Tambah Tugas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Judul Tugas',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveTask,
                child: Text(widget.task != null ? 'Simpan' : 'Tambah'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

