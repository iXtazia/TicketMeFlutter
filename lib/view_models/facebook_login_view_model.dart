import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../models/user_model.dart';

class FacebookLoginViewModel extends ChangeNotifier {
  FacebookUser? _user;
  FacebookUser? get user => _user;

  Future<void> login() async {
    final result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      _user = FacebookUser.fromJson(userData);
      notifyListeners();
    } else {
      debugPrint('Login failed: ${result.message}');
    }
  }

  Future<void> logout() async {
    await FacebookAuth.instance.logOut();
    _user = null;
    notifyListeners();
  }
}
