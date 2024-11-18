// lib/screens/task_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;

  TaskDetailScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Tarefa'),
        actions: [
          IconButton(
            icon: Icon(
              task.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              taskProvider.toggleFavoriteStatus(task.id);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nome da Tarefa
            Text(
              task.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Descrição da Tarefa
            Text(
              task.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Datas
            Text(
              'Data de Criação: ${formatDateTime(task.creationDate)}',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Data de Entrega: ${formatDateTime(task.dueDate)}',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Data de Conclusão: ${task.completionDate != null ? formatDateTime(task.completionDate!) : 'Ainda não concluída'}',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            // Botões de Ação
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: task.completionDate == null
                      ? () {
                    task.completionDate = DateTime.now();
                    taskProvider.updateTask(task);
                  }
                      : null, // Desabilitar se já concluída
                  icon: Icon(Icons.check),
                  label: Text('Marcar como Concluída'),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implementar a lógica de edição (opcional)
                  },
                  icon: Icon(Icons.edit),
                  label: Text('Editar Tarefa'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    // Formatar a data e a hora
    return '${dateTime.toLocal().toString().split(' ')[0]} às ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
