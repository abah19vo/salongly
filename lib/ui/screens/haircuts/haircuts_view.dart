import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salongly/app/app.locator.dart';
import 'package:salongly/ui/screens/haircuts/haircuts_viewmodel.dart';
import 'package:salongly/ui/widgets/custom_icon.dart';
import 'package:salongly/ui/widgets/haircuts_list.dart';
import 'package:stacked/stacked.dart';

class HaircutsView extends StatelessWidget {
  const HaircutsView({Key? key}) : super(key: key);
  static const List<IconData> _icons = [
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HaircutsViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => locator<HaircutsViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: ListView(
            key: PageStorageKey("Hair cuts view"),
            padding: EdgeInsets.symmetric(vertical: 30.0),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 120.0),
                child: Text(
                  'What would you like to find?',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons
                    .asMap()
                    .entries
                    .map((map) => CustomIcon(
                          onTap: () => model.selectedIndex = map.key,
                          icon: map.value,
                          isSelected: map.key == model.selectedIndex,
                        ))
                    .toList(),
              ),
              SizedBox(height: 20.0),
              HaircutCarousel(title:'Top haircuts', haircuts: model.haircuts),
              SizedBox(height: 20.0),
              HaircutCarousel(title:'Newest', haircuts: model.haircuts),
            ],
          ),
        ),
      ),
    );
  }
}
