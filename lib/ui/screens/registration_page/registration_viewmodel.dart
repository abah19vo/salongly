import 'package:salongly/models/user.dart';
import 'package:stacked/stacked.dart';

class RegistrationViewmodel extends BaseViewModel {
  bool _checked = false;
  User user = User();

  set checked(newState) {
    _checked = newState;
    notifyListeners();
  }

  bool get checked => _checked;
}
