import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/utility.dart';
import 'package:fit_lit/feature/auth/models/login_input_model.dart';
import 'package:fit_lit/feature/auth/models/register_input_model.dart';
import 'package:fit_lit/feature/auth/services/auth_exception.dart';

class AuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Future<Either<AuthException, User?>> register(RegisterInputModel data) async {
    try {
      /// Generate a fake email based on the username
      String fakeEmail = "${data.username}@fitlit.com";

      /// Create user in Firebase Auth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: fakeEmail,
        password: data.password,
      );

      /// Save username and email mapping in Firestore
      await _firestore
          .collection(AppConstants.KEY_USERS)
          .doc(userCredential.user!.uid)
          .set({
        'name': data.name,
        'username': data.username,
        'email': fakeEmail,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return Right(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Left(AuthException(
            message: AppConstants.ERR_USERNAME_ALREADY_REGISTERED));
      }
      return Left(AuthException(message: "Gagal register akun: ${e.message}"));
    } catch (e) {
      cprint(e);
      return Left(AuthException(message: "Gagal register akun!"));
    }
  }

  Future<Either<AuthException, User?>> login(LoginInputModel data) async {
    try {
      /// Generate a fake email based on the username
      String fakeEmail = "${data.username}@fitlit.com";

      /// Authenticate using email/password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: fakeEmail, password: data.password);

      return Right(userCredential.user);
    } on FirebaseAuthException catch (e) {
      cprint(e);
      return Left(AuthException(message: AppConstants.ERR_LOGIN_MESSAGE));
    } catch (e) {
      cprint(e);
      return Left(AuthException(message: 'Gagal login!'));
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
