import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/utility.dart';
import 'package:fit_lit/feature/home/models/account.dart';
import 'package:fit_lit/feature/home/services/profile_exception.dart';

class HomeDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Future<Either<ProfileException, Account>> getProfileData() async {
    try {
      final user = await _firestore
          .collection(AppConstants.KEY_USERS)
          .doc(currentUser?.uid)
          .get();

      return Right(Account.fromJson(user.data()!));
    } catch (e) {
      cprint(e);
      throw Left(ProfileException(message: e.toString()));
    }
  }
}
