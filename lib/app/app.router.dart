// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/screens/authentication/registration_page/registration_view.dart';
import '../ui/screens/haircuts/haircuts_view.dart';
import '../ui/screens/home_page/home_view.dart';

class Routes {
  static const String homeView = '/home-view';
  static const String registrationView = '/';
  static const String haircutsView = '/haircuts-view';
  static const all = <String>{
    homeView,
    registrationView,
    haircutsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.registrationView, page: RegistrationView),
    RouteDef(Routes.haircutsView, page: HaircutsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    RegistrationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegistrationView(),
        settings: data,
      );
    },
    HaircutsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HaircutsView(),
        settings: data,
      );
    },
  };
}
