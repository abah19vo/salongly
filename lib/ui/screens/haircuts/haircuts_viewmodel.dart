

import 'package:salongly/app/enums.dart';
import 'package:salongly/models/haircut.dart';
import 'package:stacked/stacked.dart';

class HaircutsViewModel extends FutureViewModel {

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
  List<Haircut> haircuts = List<Haircut>.generate(
  5,
  (index) => Haircut(
    id: index.toString(),
    description: 'bla blo blu bli' * 3,
    imgUrl: 'https://raw.githubusercontent.com/MarcusNg/flutter_travel_ui/master/assets/images/gondola.jpg',
    name: 'arcane ' + index.toString(),
    price: index * 72,
    rating: index * 2,
    type: HaircutType.values[index % 3],
  ),
);

  @override
  Future futureToRun() async {
    
    
  }

}