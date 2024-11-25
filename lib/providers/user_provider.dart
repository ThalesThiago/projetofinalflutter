import 'package:flutter/foundation.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User _user = User(
    id: 1,
    name: 'João Silva',
    email: 'joao.silva@example.com',
    dateOfBirth: DateTime(1990, 5, 15),
  );

  User get user => _user;

  
  void updateUser(User updatedUser) {
    _user = updatedUser;
    notifyListeners(); 
  }

  
  void updateName(String name) {
    _user.name = name;
    notifyListeners(); 
  }

  void updateEmail(String email) {
    _user.email = email;
    notifyListeners();
  }

  void updateDateOfBirth(DateTime dateOfBirth) {
    _user.dateOfBirth = dateOfBirth;
    notifyListeners();
  }
}
