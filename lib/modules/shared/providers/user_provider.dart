import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt/modules/shared/models/user.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  User? _user; // Current User

  User? get user => _user;

  bool userLoggedIn() {
    if (user?.isLoggedIn == true) {
      return true;
    } else {
      return false;
    }
  }

  void loginUser(User user) {
    _user = user;
    notifyListeners();
  }

  void logoutUser() {
    _user = null;
    notifyListeners();
  }
}

final userProvider =
    ChangeNotifierProvider<UserProvider>((ref) => UserProvider());
