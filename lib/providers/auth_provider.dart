import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isAdmin = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get isAdmin => _isAdmin;

  Future<bool> login(String email, String password) async {
    if (email == 'admin' && password == 'admin') {
      _isAuthenticated = true;
      _isAdmin = true;
      notifyListeners();
      return true;
    } else if (email.isNotEmpty && password.isNotEmpty) {
      _isAuthenticated = true;
      _isAdmin = false;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _isAuthenticated = false;
    _isAdmin = false;
    notifyListeners();
  }
} 