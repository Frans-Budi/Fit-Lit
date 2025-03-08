import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_lit/feature/auth/models/login_input_model.dart';
import 'package:fit_lit/feature/auth/models/register_input_model.dart';
import 'package:fit_lit/feature/auth/services/auth_data_source.dart';
import 'package:fit_lit/feature/auth/services/auth_exception.dart';

class AuthRepository {
  final AuthDataSource source;
  AuthRepository(this.source);

  User? get currentUser => source.currentUser;

  Future<Either<AuthException, User?>> register(RegisterInputModel data) =>
      source.register(data);

  Future<Either<AuthException, User?>> login(LoginInputModel data) =>
      source.login(data);

  Future<void> logout() => source.logout();
}
