import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:salongly/app/theme.dart';
import 'package:salongly/ui/screens/booking/booking_view.dart';
import 'package:salongly/ui/screens/haircuts/haircuts_view.dart';
import 'package:salongly/ui/screens/home_page/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (BuildContext context, HomeViewModel model, Widget? child) => Scaffold(
        body: PageTransitionSwitcher(
          reverse: model.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              SharedAxisTransition(
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
          ),
          child: getViewForIndex(model.currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              label: "Hair cuts",
              activeIcon: Icon(
                Icons.face_retouching_natural_outlined,
                color: CustomeColors.green,
                size: 30.0,
              ),
              icon: Icon(
                Icons.face_retouching_natural_outlined,
                size: 30.0,
              ),
            ),
            BottomNavigationBarItem(
              label: "Bookings",
              activeIcon: Icon(
                Icons.calendar_month_rounded,
                color: CustomeColors.green,
                size: 30.0,
              ),
              icon: Icon(
                Icons.calendar_month_rounded,
                size: 30.0,
              ),
            ),
            BottomNavigationBarItem(
              label: "Me",
              activeIcon: Icon(
                Icons.calendar_month_rounded,
                color: CustomeColors.green,
                size: 30.0,
              ),
              icon: CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
              ),
            )
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HaircutsView();
      case 1:
        return BookingView();
      case 3:
        return HaircutsView();
      default:
        return HaircutsView();
    }
  }
}
