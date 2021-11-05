import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salongly/app/app.locator.dart';
import 'package:salongly/models/user.dart';
import 'package:salongly/services/user_service.dart';
import 'package:salongly/ui/screens/home_page/home_view.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  User user = User();
  final userService = locator<UserService>();
  List<String> validatingErrors = [];
  bool isLoading = false;

  void validate() {
    validatingErrors = user.validateLogin();
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    validate();
    notifyListeners();

    if (validatingErrors.isEmpty) {
      isLoading = true;
      notifyListeners();
      userService.login(user).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
        );
      }).onError((firebaseAuth.FirebaseAuthException error, stackTrace) {
        if (error.message != null) validatingErrors.add(error.message!);
        notifyListeners();
      }).onError((PlatformException error, stackTrace) {
        if (error.message != null) validatingErrors.add(error.message!);
        notifyListeners();
      }).onError((error, stackTrace) {
        validatingErrors.add(error.toString());
        notifyListeners();
      }).whenComplete(() {
        isLoading = false;
        notifyListeners();
      });
    }
  }
}

