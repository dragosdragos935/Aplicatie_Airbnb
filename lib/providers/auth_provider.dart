import 'package:flutter/foundation.dart';

class UserData {
  final String name;
  final String email;
  final String? phone;
  final String? address;

  UserData({
    required this.name,
    required this.email,
    this.phone,
    this.address,
  });

  UserData copyWith({
    String? name,
    String? email,
    String? phone,
    String? address,
  }) {
    return UserData(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isAdmin = false;
  UserData? _userData;

  bool get isAuthenticated => _isAuthenticated;
  bool get isAdmin => _isAdmin;
  UserData? get userData => _userData;

  Future<bool> login(String email, String password) async {
    if (email == 'admin@admin.com' && password == 'admin') {
      _isAuthenticated = true;
      _isAdmin = true;
      _userData = UserData(
        name: 'Admin User',
        email: 'admin@admin.com',
      );
      notifyListeners();
      return true;
    } else if (email.isNotEmpty && password.isNotEmpty) {
      _isAuthenticated = true;
      _isAdmin = false;
      _userData = UserData(
        name: email.split('@')[0],
        email: email,
      );
      notifyListeners();
      return true;
    }
    return false;
  }

  void updateUserData(UserData newData) {
    _userData = newData;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _isAdmin = false;
    _userData = null;
    notifyListeners();
  }
} 