import 'package:flutter/foundation.dart';

class User {
  final int id;
  String name;
  String email;
  DateTime dateOfBirth;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.dateOfBirth,
  });
}
