

import 'package:stacked/stacked.dart';

class HaircutsViewModel extends FutureViewModel {

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  @override
  Future futureToRun() async {
    
    
  }

}