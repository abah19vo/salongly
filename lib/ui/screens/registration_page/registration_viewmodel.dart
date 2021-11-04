import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salongly/app/app.locator.dart';
import 'package:salongly/models/user.dart';
import 'package:salongly/services/user_service.dart';
import 'package:salongly/ui/screens/home_page/home_view.dart';
import 'package:salongly/ui/screens/login_page/login_view.dart';
import 'package:stacked/stacked.dart';

class RegistrationViewmodel extends BaseViewModel {
  bool _checked = false;
  User user = User();
  final userService = locator<UserService>();
  String repeatedPassword = '';
  List<String> validatingErrors = [];

  void validate() {
    validatingErrors = user.validateUser();
    if (user.password != repeatedPassword)
      validatingErrors.add('Ogiltigt Upprepat Lösenord');
    notifyListeners();
  }

  void register(BuildContext context) {
    validate();
    notifyListeners();
    if (validatingErrors.isNotEmpty) {
      userService.register(user).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginView()),
        );
      });
    }
  }

  set checked(newState) {
    _checked = newState;
    notifyListeners();
  }

  bool get checked => _checked;
}
