import 'package:gymnotes/ui/base/authentication_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

import 'login_view.form.dart';

class LoginViewModel extends AuthenticationViewModel {

  final _firebaseAuthenticationService = locator<FirebaseAuthenticationService>();

  LoginViewModel() : super(successRoute: Routes.dashboardView);

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() {
    return _firebaseAuthenticationService.loginWithEmail(
      email: emailValue!,
      password: passwordValue!
    );
  }

  void navigateToCreateAccount() {
    navigationService.navigateTo(Routes.createAccountView);
  }
}