import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:salongly/ui/screens/authentication/registration_page/registration_view.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      home: RegistrationView(),
    );
  }
}
