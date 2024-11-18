// lib/models/task.dart

import 'package:flutter/foundation.dart';

class Task {
  final int id;
  String title;
  String description;
  DateTime creationDate;
  DateTime dueDate;
  DateTime? completionDate;
  bool isFavorite;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.dueDate,
    this.completionDate,
    this.isFavorite = false,
  });
}
