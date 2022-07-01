import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salongly/app/app.locator.dart';
import 'package:salongly/app/app.router.dart';
import 'package:salongly/models/user.dart';
import 'package:salongly/services/user_service.dart';
import 'package:salongly/ui/screens/home_page/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  User user = User();
  final userService = locator<UserService>();
  final NavigationService _navigationService = locator<NavigationService>();
  List<String> validatingErrors = [];
  bool isLoading = false;

  void validate() {
    validatingErrors = user.validateLogin();
    notifyListeners();
  }

  Future<void> login() async {
    validate();
    notifyListeners();

    if (validatingErrors.isEmpty) {
      isLoading = true;
      notifyListeners();
      userService.login(user).then((value) {
        _navigationService.replaceWith(Routes.homeView);
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
