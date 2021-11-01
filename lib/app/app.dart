import 'package:salongly/models/user.dart';
import 'package:salongly/services/user_service.dart';
import 'package:salongly/ui/screens/home_page/home_view.dart';
import 'package:salongly/ui/screens/registration_page/registration_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView,),
    MaterialRoute(page: RegistrationView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: UserService),
    LazySingleton(classType: User),
  ],
)
// flutter pub run build_runner build --delete-conflicting-outputs
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
