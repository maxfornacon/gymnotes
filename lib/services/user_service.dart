import 'package:gymnotes/api/firestore_api.dart';
import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/app/app.logger.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class UserService {
  final log = getLogger('UserService');

  final FirestoreApi _firestoreApi = locator<FirestoreApi>();
  final FirebaseAuthenticationService _firebaseAuthenticationService = locator<FirebaseAuthenticationService>();

  User? _currentUser;
  User get currentUser => _currentUser!;

  Future<void> syncUserAccount() async {
    final firebaseUserId = _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;
    log.v('Sync user account for user with id $firebaseUserId');

    final userAccount = await _firestoreApi.getUser(userId: firebaseUserId);

    if (userAccount != null) {
      log.v('User account exists. Save as _currentUser');
      _currentUser = userAccount;
    }
  }

  Future<void> syncOrCreateUserAccount({required User user}) async {
    log.i('user: $user');

    await syncUserAccount();

    if (_currentUser == null) {
      log.v('User account does not exist. Create new user account');
      await _firestoreApi.createUser(user: user);
      _currentUser = user;
      log.v('_currentUser has been set');
    }
  }
}