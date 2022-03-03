import 'package:salongly/models/user.dart';
import 'package:salongly/services/user_service.dart';
import 'package:salongly/ui/screens/authentication/registration_page/registration_view.dart';
import 'package:salongly/ui/screens/booking/booking_viewmodel.dart';
import 'package:salongly/ui/screens/haircuts/haircuts_view.dart';
import 'package:salongly/ui/screens/haircuts/haircuts_viewmodel.dart';
import 'package:salongly/ui/screens/home_page/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView,),
    MaterialRoute(page: RegistrationView, initial: true),
    MaterialRoute(page: HaircutsView),
  ],
  dependencies: [
    LazySingleton(classType: UserService),
    LazySingleton(classType: User),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HaircutsViewModel),
    LazySingleton(classType: BookingViewModel),
  ],
)
// flutter pub run build_runner build --delete-conflicting-outputs
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
