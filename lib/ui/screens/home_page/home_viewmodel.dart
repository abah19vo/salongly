import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String title = '';

  void doSomething() {

    notifyListeners();
  }
}
