// lib/screens/task_list_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import 'task_detail_screen.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.tasks;

    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Tarefas'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Implementar filtro (opcional)
            },
          ),
        ],
      ),
      body: tasks.isEmpty
          ? Center(
        child: Text('Nenhuma tarefa adicionada.'),
      )
          : ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          var task = tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(
              'Entrega: ${formatDateTime(task.dueDate)}',
            ),
            trailing: Icon(
              task.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: task.isFavorite ? Colors.red : null,
            ),
            onTap: () async {
              // Navegar para a tela de detalhes usando MaterialPageRoute
              final updatedTask = await Navigator.push<Task>(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetailScreen(task: task),
                ),
              );

              if (updatedTask != null) {
                taskProvider.updateTask(updatedTask);
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navegar para a tela de adicionar tarefa e esperar o resultado
          final newTask = await Navigator.push<Task>(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );

          if (newTask != null) {
            taskProvider.addTask(newTask);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    // Formatar a data e a hora
    return '${dateTime.toLocal().toString().split(' ')[0]} às ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
