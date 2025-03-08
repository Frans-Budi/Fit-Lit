import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_lit/feature/home/models/account.dart';
import 'package:fit_lit/feature/home/services/home_data_source.dart';
import 'package:fit_lit/feature/home/services/profile_exception.dart';

class HomeRepository {
  final HomeDataSource source;
  HomeRepository(this.source);

  User? get currentUser => source.currentUser;

  Future<Either<ProfileException, Account>> getProfileData() =>
      source.getProfileData();
}
