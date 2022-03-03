import 'package:flutter/material.dart';
import 'package:salongly/app/app.locator.dart';
import 'package:salongly/models/user.dart';
import 'package:salongly/services/user_service.dart';
import 'package:salongly/ui/screens/home_page/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;

class RecoverPasswordViewModel extends BaseViewModel {
  User user = User();
  final userService = locator<UserService>();
  List<String> validatingErrors = [];
  bool _checked = false;
  bool isSent = false;

  set checked(newState) {
    _checked = newState;
    notifyListeners();
  }

  bool get checked => _checked;

  void validate() {
    validatingErrors = user.validateLogin();

    notifyListeners();
  }

  void login(BuildContext context) {
    validate();
    notifyListeners();
    if (validatingErrors.isNotEmpty) {
      try {
        userService.login(user).then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
          );
        });
      } on firebaseAuth.FirebaseAuthException catch (e) {
        if (e.message != null) validatingErrors.add(e.message!);
        notifyListeners();
      } on Exception catch (e) {
        validatingErrors.add(e.toString());
        notifyListeners();
      }
    }
  }
}
