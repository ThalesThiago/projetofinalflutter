// lib/screens/main_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/drawer_widget.dart';
import '../providers/task_provider.dart';
import 'task_detail_screen.dart';
import '../models/task.dart';


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.tasks;

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Gerenciador de Tarefas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              // Ação para adicionar nova tarefa
              final newTask = await Navigator.pushNamed(context, '/addTask') as Task?;
              if (newTask != null) {
                taskProvider.addTask(newTask);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implementar ação de busca (opcional)
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
    );
  }

  String formatDateTime(DateTime dateTime) {
    // Formatar a data e a hora
    return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year} às ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
