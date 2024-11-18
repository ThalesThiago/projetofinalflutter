// lib/providers/task_provider.dart

import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      id: 1,
      title: 'Comprar mantimentos',
      description: 'Comprar leite, pão, e ovos no supermercado.',
      creationDate: DateTime.now(),
      dueDate: DateTime.now().add(Duration(days: 2, hours: 14)),
      isFavorite: false,
    ),
    Task(
      id: 2,
      title: 'Estudar Flutter',
      description: 'Completar o capítulo sobre State Management.',
      creationDate: DateTime.now(),
      dueDate: DateTime.now().add(Duration(days: 5, hours: 10)),
      isFavorite: true,
    ),
    Task(
      id: 3,
      title: 'Ir à academia',
      description: 'Sessão de musculação e cardio.',
      creationDate: DateTime.now(),
      dueDate: DateTime.now().add(Duration(days: 1, hours: 18)),
      isFavorite: false,
    ),
  ];

  List<Task> get tasks {
    // Retornar uma cópia da lista ordenada pelas datas de entrega mais próximas
    List<Task> sortedTasks = [..._tasks];
    sortedTasks.sort((a, b) => a.dueDate.compareTo(b.dueDate));
    return sortedTasks;
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task updatedTask) {
    final index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index >= 0) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  void toggleFavoriteStatus(int taskId) {
    final index = _tasks.indexWhere((task) => task.id == taskId);
    if (index >= 0) {
      _tasks[index].isFavorite = !_tasks[index].isFavorite;
      notifyListeners();
    }
  }
}
