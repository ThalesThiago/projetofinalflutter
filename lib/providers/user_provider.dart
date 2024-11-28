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
    if (name.isNotEmpty && name != _user.name) {
      _user.name = name;
      notifyListeners();
    }
  }

  
  void updateEmail(String email) {
    if (email.isNotEmpty && email.contains('@') && email != _user.email) {
      _user.email = email;
      notifyListeners();
    }
  }

  
  void updateDateOfBirth(DateTime dateOfBirth) {
    if (dateOfBirth != _user.dateOfBirth) {
      _user.dateOfBirth = dateOfBirth;
      notifyListeners();
    }
  }

  void editUserDetails({
    String? name,
    String? email,
    DateTime? dateOfBirth,
  }) {
    bool hasChanges = false;

    if (name != null && name.isNotEmpty && name != _user.name) {
      _user.name = name;
      hasChanges = true;
    }
    if (email != null && email.isNotEmpty && email.contains('@') && email != _user.email) {
      _user.email = email;
      hasChanges = true;
    }
    if (dateOfBirth != null && dateOfBirth != _user.dateOfBirth) {
      _user.dateOfBirth = dateOfBirth;
      hasChanges = true;
    }

    if (hasChanges) {
      notifyListeners();
    }
  }
}
